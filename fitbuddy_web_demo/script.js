const video = document.getElementById("video");
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const feedback = document.getElementById("feedback");

// ✅ Flutter → JS로 운동명 받아오기
let selectedExercise = "스쿼트"; // 기본값

window.setExercise = function(name) {
  selectedExercise = name;
  console.log("선택된 운동:", selectedExercise);
};

// ✅ 관절 각도 계산 함수
function calculateAngle(a, b, c) {
  const radians = Math.atan2(c.y - b.y, c.x - b.x) - Math.atan2(a.y - b.y, a.x - b.x);
  let angle = Math.abs(radians * (180.0 / Math.PI));
  if (angle > 180.0) angle = 360 - angle;
  return parseFloat(angle.toFixed(2));
}

// 🦴 전신 관절 각도 계산
function getJointAngles(landmarks) {
  return {
    팔꿈치: calculateAngle(landmarks[11], landmarks[13], landmarks[15]),
    어깨: calculateAngle(landmarks[23], landmarks[11], landmarks[13]),
    가슴: calculateAngle(landmarks[11], landmarks[23], landmarks[24]),
    등: calculateAngle(landmarks[13], landmarks[11], landmarks[23]),
    복부: calculateAngle(landmarks[23], landmarks[11], landmarks[24]),
    엉덩이: calculateAngle(landmarks[11], landmarks[23], landmarks[25]),
    무릎: calculateAngle(landmarks[23], landmarks[25], landmarks[27]),
    다리: calculateAngle(landmarks[25], landmarks[27], landmarks[31]),
    몸통: calculateAngle(landmarks[11], landmarks[23], landmarks[27])
  };
}

// 💪 운동별 피드백 함수
function checkSquat(angles) {
  if (angles["무릎"] > 170) {
    feedback.innerText = "무릎이 너무 펴졌어요! 살짝 굽혀주세요."; return;
  }
  if (angles["무릎"] < 90) {
    feedback.innerText = "무릎을 너무 많이 굽히지 않도록 주의해주세요."; return;
  }
  if (angles["엉덩이"] < 150) {
    feedback.innerText = "엉덩이가 너무 처졌어요! 허리를 곧게 펴주세요."; return;
  }
  feedback.innerText = "스쿼트 자세 좋아요! 👍";
}

function checkPlank(angles) {
  if (angles["팔꿈치"] > 110 || angles["팔꿈치"] < 70) {
    feedback.innerText = "팔꿈치 각도를 조정해주세요."; return;
  }
  if (angles["몸통"] < 150) {
    feedback.innerText = "엉덩이가 너무 내려갔어요! 몸을 일자로 유지해주세요."; return;
  }
  feedback.innerText = "플랭크 자세 좋아요! 👍";
}

function checkPushup(angles) {
  if (angles["팔꿈치"] < 60) {
    feedback.innerText = "팔꿈치를 너무 굽혔어요! 좀 더 펴보세요."; return;
  }
  if (angles["팔꿈치"] > 120) {
    feedback.innerText = "팔꿈치를 너무 폈어요! 부상의 위험이 있어요."; return;
  }
  if (angles["몸통"] < 150) {
    feedback.innerText = "몸이 처졌어요! 일직선 유지해주세요."; return;
  }
  feedback.innerText = "푸쉬업 자세 좋아요! 👍";
}

// 운동명 → 피드백 함수 매핑
const feedbackRules = {
  "스쿼트": checkSquat,
  "플랭크": checkPlank,
  "푸쉬업": checkPushup
};

// Mediapipe Pose 설정
const pose = new Pose({
  locateFile: (file) => `https://cdn.jsdelivr.net/npm/@mediapipe/pose@0.5/${file}`
});
pose.setOptions({
  modelComplexity: 1,
  minDetectionConfidence: 0.5,
  minTrackingConfidence: 0.5
});

// 🎯 결과 받아 처리
pose.onResults((results) => {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.drawImage(results.image, 0, 0, canvas.width, canvas.height);

  if (results.poseLandmarks) {
    drawConnectors(ctx, results.poseLandmarks, Pose.POSE_CONNECTIONS, { color: "#00FF00", lineWidth: 2 });
    drawLandmarks(ctx, results.poseLandmarks, { color: "#FF0000", lineWidth: 2 });

    const angles = getJointAngles(results.poseLandmarks);

    if (feedbackRules[selectedExercise]) {
      feedbackRules[selectedExercise](angles);
    } else {
      feedback.innerText = "운동을 선택해주세요!";
    }
  }
});

// 🎥 카메라 연결
const camera = new Camera(video, {
  onFrame: async () => {
    await pose.send({ image: video });
  },
  width: 640,
  height: 480,
});
camera.start();