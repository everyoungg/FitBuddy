const video = document.getElementById("video");
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const feedback = document.getElementById("feedback");

let lastSpoken = ""; // 같은 말 반복 방지용

function speak(text) {
  if (lastSpoken === text) return;
  lastSpoken = text;

  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = 'ko-KR';
  window.speechSynthesis.cancel();
  window.speechSynthesis.speak(utterance);
}

function calculateAngle(a, b, c) {
  const radians = Math.atan2(c.y - b.y, c.x - b.x) - Math.atan2(a.y - b.y, a.x - b.x);
  let angle = Math.abs(radians * (180.0 / Math.PI));
  if (angle > 180.0) angle = 360 - angle;
  return parseFloat(angle.toFixed(2));
}

function getJointAngles(landmarks) {
  return {
    팔꿈치: calculateAngle(landmarks[11], landmarks[13], landmarks[15]),
    무릎: calculateAngle(landmarks[23], landmarks[25], landmarks[27])
  };
}

function checkFeedback(angles) {
  if (angles["팔꿈치"] > 160) {
    feedback.innerText = "팔꿈치를 너무 폈어요!";
    speak("팔꿈치를 너무 폈어요");
  } else if (angles["팔꿈치"] < 70) {
    feedback.innerText = "팔꿈치를 너무 굽혔어요!";
    speak("팔꿈치를 너무 굽혔어요");
  } else if (angles["무릎"] > 170) {
    feedback.innerText = "무릎이 너무 펴졌어요!";
    speak("무릎이 너무 펴졌어요");
  } else if (angles["무릎"] < 90) {
    feedback.innerText = "무릎을 너무 굽혔어요!";
    speak("무릎을 너무 굽혔어요");
  } else {
    feedback.innerText = "📍 자세 좋아요!";
    speak("자세 좋아요");
  }
}

// Mediapipe 설정
const pose = new Pose({
  locateFile: (file) => `https://cdn.jsdelivr.net/npm/@mediapipe/pose@0.5/${file}`
});
pose.setOptions({
  modelComplexity: 1,
  minDetectionConfidence: 0.5,
  minTrackingConfidence: 0.5
});

pose.onResults((results) => {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.drawImage(results.image, 0, 0, canvas.width, canvas.height);

  if (results.poseLandmarks) {
    drawConnectors(ctx, results.poseLandmarks, Pose.POSE_CONNECTIONS, { color: "#00FF00", lineWidth: 2 });
    drawLandmarks(ctx, results.poseLandmarks, { color: "#FF0000", lineWidth: 2 });

    const angles = getJointAngles(results.poseLandmarks);
    checkFeedback(angles);
  }
});

// 카메라 시작
const camera = new Camera(video, {
  onFrame: async () => {
    await pose.send({ image: video });
  },
  width: 640,
  height: 480,
});
camera.start();
