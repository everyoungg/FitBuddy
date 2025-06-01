let pose;

// 카메라 비디오 요소 생성
const video = document.createElement('video');
video.setAttribute('id', 'camera-feed');
video.setAttribute('autoplay', '');
video.setAttribute('playsinline', '');
video.style.position = 'fixed';
video.style.top = '0';
video.style.left = '0';
video.style.width = '100%';
video.style.height = '100%';
video.style.objectFit = 'cover';
video.style.zIndex = '0';

// 비디오 요소를 body에 추가
document.body.appendChild(video);

async function startPoseDetection() {
  try {
    const stream = await navigator.mediaDevices.getUserMedia({
      video: {
        width: { ideal: 1280 },
        height: { ideal: 720 },
        facingMode: 'user'
      }
    });
    video.srcObject = stream;
    await video.play();
    console.log('Camera started successfully');

    // MediaPipe Pose 초기화
    pose = new Pose({
      locateFile: (file) => `https://cdn.jsdelivr.net/npm/@mediapipe/pose/${file}`
    });
    pose.setOptions({
      modelComplexity: 1,
      smoothLandmarks: true,
      enableSegmentation: false,
      minDetectionConfidence: 0.5,
      minTrackingConfidence: 0.5
    });

    pose.onResults((results) => {
      if (window.flutterPoseResults) {
        window.flutterPoseResults(JSON.stringify(results));
      }
    });

    async function detectFrame() {
      if (video.readyState === 4) {
        await pose.send({image: video});
      }
      requestAnimationFrame(detectFrame);
    }
    detectFrame();
  } catch (error) {
    console.error('Error accessing camera:', error);
  }
}

// 카메라 스트림 중지
function stopPoseDetection() {
  if (video.srcObject) {
    const tracks = video.srcObject.getTracks();
    tracks.forEach(track => track.stop());
    video.srcObject = null;
  }
  if (pose) {
    pose.close();
  }
}

window.startPoseDetection = startPoseDetection;
window.stopPoseDetection = stopPoseDetection; 