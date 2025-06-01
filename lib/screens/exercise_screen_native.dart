import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// 네이티브 환경에서만 사용되는 ML Kit 관련 import
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:flutter/foundation.dart';

// ExerciseScreen 위젯 정의를 가져옵니다.
import 'exercise_screen.dart';

// 네이티브(모바일) 플랫폼을 위한 ExerciseScreenState 구현
// Flutter의 State<ExerciseScreen>을 직접 상속합니다.
class ExerciseScreenStateNative extends State<ExerciseScreen> {
  late CameraController _controller;
  late PoseDetector _poseDetector;
  bool _isDetecting = false;
  Map<String, double> _angles = {};

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _poseDetector = PoseDetector(
      options: PoseDetectorOptions(
        model: PoseDetectionModel.base,
        mode: PoseDetectionMode.stream,
      ),
    );
  }

  Future<void> _initializeCamera() async {
    if (widget.camera == null) {
      // 네이티브 환경에서는 camera가 필수이므로 에러 처리 또는 방어 코드 추가
      print('Camera is not provided in native environment.');
      // 상태를 업데이트하여 에러 메시지를 표시하거나 다른 처리를 할 수 있습니다.
      return;
    }
    _controller = CameraController(
      widget.camera!,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    try {
      await _controller.initialize();
      if (!mounted) return;
      await _controller.startImageStream(_processImage);
      setState(() {}); // 카메라 초기화 후 UI 업데이트
    } catch (e) {
       print('Error initializing camera: $e');
       // Handle camera initialization errors on native
       // 예: 에러 메시지 표시 등
    }
  }

  Future<void> _processImage(CameraImage image) async {
    if (_isDetecting) return;
    _isDetecting = true;

    // ML Kit 처리를 위한 코드
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final imageSize = Size(image.width.toDouble(), image.height.toDouble());
    // InputImageRotation 및 InputImageFormat은 google_mlkit_commons에 정의
    final imageRotation = InputImageRotation.rotation0deg; // Assuming 0 rotation
    final inputImageFormat = InputImageFormat.bgra8888; // 또는 다른 형식
    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();
    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );
    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: inputImageData,
    );

    try {
      // PoseDetector는 google_mlkit_pose_detection에 정의
      final poses = await _poseDetector.processImage(inputImage);
      if (poses.isNotEmpty) {
        _analyzePose(poses.first);
      }
    } catch (e) {
      print('Error processing image with ML Kit: $e');
       // Handle ML Kit processing errors
    }

    _isDetecting = false;
  }

  void _analyzePose(Pose pose) {
    final landmarks = pose.landmarks;
    if (landmarks.isEmpty) return;

    setState(() {
      // Calculate angles and update _angles
      // PoseLandmark는 google_mlkit_pose_detection에 정의
      _angles = {
        '팔꿈치': _calculateAngle(landmarks[11], landmarks[13], landmarks[15]),
        '어깨': _calculateAngle(landmarks[23], landmarks[11], landmarks[13]),
        '가슴': _calculateAngle(landmarks[11], landmarks[23], landmarks[24]),
        '등': _calculateAngle(landmarks[13], landmarks[11], landmarks[23]),
        '복부': _calculateAngle(landmarks[23], landmarks[11], landmarks[24]),
        '엉덩이': _calculateAngle(landmarks[11], landmarks[23], landmarks[25]),
        '무릎': _calculateAngle(landmarks[23], landmarks[25], landmarks[27]),
        '다리': _calculateAngle(landmarks[25], landmarks[27], landmarks[31])
      };
    });
  }

  double _calculateAngle(PoseLandmark? a, PoseLandmark? b, PoseLandmark? c) {
    if (a == null || b == null || c == null) return 0.0;
    final ab = [a.x - b.x, a.y - b.y];
    final cb = [c.x - b.x, c.y - b.y];
    final radians = atan2(cb[1], cb[0]) - atan2(ab[1], ab[0]);
    var angle = (radians * 180.0 / 3.1415926535897932).abs();
    if (angle > 180.0) {
      angle = 360 - angle;
    }
    return angle;
  }

  @override
  void dispose() {
    _controller.dispose();
    _poseDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.exerciseType} 운동'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(_controller),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '현재 자세 분석:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                ..._angles.entries.map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${entry.key}: ${entry.value.toStringAsFixed(1)}°',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 네이티브 플랫폼용 State 생성 함수
State<ExerciseScreen> createExerciseScreenState() => ExerciseScreenStateNative();