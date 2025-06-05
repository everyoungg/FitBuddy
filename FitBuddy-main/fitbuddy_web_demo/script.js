const video = document.getElementById("video");
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// 캔버스 크기 설정
canvas.width = 640;
canvas.height = 480;

function calculateAngle(a, b, c) {
  const radians = Math.atan2(c.y - b.y, c.x - b.x) - Math.atan2(a.y - b.y, a.x - b.x);
  let angle = Math.abs(radians * (180.0 / Math.PI));
  if (angle > 180.0) angle = 360 - angle;
  return parseFloat(angle.toFixed(2));
}

function getJointAngles(landmarks) {
  return {
    팔꿈치: calculateAngle(landmarks[11], landmarks[13], landmarks[15]),
    무릎: calculateAngle(landmarks[23], landmarks[25], landmarks[27]),
    엉덩이: calculateAngle(landmarks[11], landmarks[23], landmarks[25]),
    몸통: calculateAngle(landmarks[11], landmarks[23], landmarks[27])
  };
}

const pose = new Pose({
  locateFile: (file) => `https://cdn.jsdelivr.net/npm/@mediapipe/pose/${file}`
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
    drawConnectors(ctx, results.poseLandmarks, Pose.POSE_CONNECTIONS, {
      color: "#00FF00",
      lineWidth: 2
    });
    drawLandmarks(ctx, results.poseLandmarks, {
      color: "#FF0000",
      lineWidth: 2
    });

    const angles = getJointAngles(results.poseLandmarks);
    ctx.font = "20px Arial";
    ctx.fillStyle = "#222";
    let y = 30;
    for (const [joint, angle] of Object.entries(angles)) {
      ctx.fillText(`${joint}: ${angle}°`, 10, y);
      y += 30;
    }
    console.log("📐 관절 각도:", angles);
  }
});

async function setupCamera() {
  try {
    console.log('카메라 설정 시작...');
    const stream = await navigator.mediaDevices.getUserMedia({
      video: {
        width: { ideal: 640 },
        height: { ideal: 480 },
        facingMode: 'user'
      }
    });
    console.log('카메라 스트림 획득 성공');
    
    video.srcObject = stream;
    return new Promise((resolve) => {
      video.onloadedmetadata = () => {
        console.log('비디오 메타데이터 로드 완료');
        video.play();
        resolve(video);
      };
    });
  } catch (error) {
    console.error('카메라 설정 중 오류 발생:', error);
    alert('카메라 접근에 실패했습니다. 카메라 권한을 확인해주세요.');
    throw error;
  }
}

async function detectPose() {
  try {
    await pose.send({ image: video });
    requestAnimationFrame(detectPose);
  } catch (error) {
    console.error('포즈 감지 중 오류 발생:', error);
  }
}

// 페이지 로드 시 자동으로 카메라 시작
window.onload = async () => {
  try {
    await setupCamera();
    detectPose();
  } catch (error) {
    console.error('초기화 중 오류 발생:', error);
  }
};

// 웰컴 스크린에서 시작 버튼 클릭 시 실행
const startBtn = document.getElementById("startBtn");
if (startBtn) {
  startBtn.onclick = async function() {
    document.getElementById("welcome").style.display = "none";
    document.getElementById("main").style.display = "block";
    await setupCamera();
  };
} 