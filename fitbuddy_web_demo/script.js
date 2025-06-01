const video = document.getElementById("video");
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// ✅ 각도 계산 함수
function calculateAngle(a, b, c) {
  const radians = Math.atan2(c.y - b.y, c.x - b.x) - Math.atan2(a.y - b.y, a.x - b.x);
  let angle = Math.abs(radians * (180.0 / Math.PI));
  if (angle > 180.0) angle = 360 - angle;
  return parseFloat(angle.toFixed(2));
}

// ✅ 주요 관절 각도 계산
function getJointAngles(landmarks) {
  return {
    팔꿈치: calculateAngle(landmarks[11], landmarks[13], landmarks[15]),
    무릎: calculateAngle(landmarks[23], landmarks[25], landmarks[27]),
    엉덩이: calculateAngle(landmarks[11], landmarks[23], landmarks[25]),
    몸통: calculateAngle(landmarks[11], landmarks[23], landmarks[27])
  };
}

// ✅ Mediapipe Pose 초기화 (수정된 부분!)
const pose = new Pose({
  locateFile: (file) => `https://cdn.jsdelivr.net/npm/@mediapipe/pose/${file}`
});
pose.setOptions({
  modelComplexity: 1,
  minDetectionConfidence: 0.5,
  minTrackingConfidence: 0.5
});

// ✅ Mediapipe 결과 처리
pose.onResults((results) => {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.drawImage(results.image, 0, 0, canvas.width, canvas.height);

  if (results.poseLandmarks) {
    drawConnectors(ctx, results.poseLandmarks, Pose.POSE_CONNECTIONS, {
      color: "#00FF00", lineWidth: 2
    });
    drawLandmarks(ctx, results.poseLandmarks, {
      color: "#FF0000", lineWidth: 2
    });

    const angles = getJointAngles(results.poseLandmarks);
    console.log("📐 관절 각도:", angles);
  }
});

// ✅ 카메라 연결
async function setupCamera() {
  const stream = await navigator.mediaDevices.getUserMedia({ video: true });
  video.srcObject = stream;
  video.onloadedmetadata = () => {
    video.play();
    detectPose();
  };
}

// ✅ 반복 추론
async function detectPose() {
  await pose.send({ image: video });
  requestAnimationFrame(detectPose);
}

setupCamera();
