import 'package:flutter/material.dart';
import 'dart:html' as html; // 웹 관련 import
import 'dart:js' as js; // JS 연동 import
import 'dart:convert'; // JSON 파싱
import 'package:flutter/foundation.dart'; // kIsWeb 사용을 위해 필요

// ExerciseScreen 위젯 정의를 가져옵니다.
import 'exercise_screen.dart';

// 웹 플랫폼을 위한 ExerciseScreenState 구현
// Flutter의 State<ExerciseScreen>을 직접 상속합니다.
class ExerciseScreenStateWeb extends State<ExerciseScreen> {
  Map<String, dynamic>? _poseResults;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    // 페이지 로드 후 JS 함수 호출
    html.window.addEventListener('load', (event) {
       // JS에서 pose 결과를 받을 핸들러 등록
      js.context['flutterPoseResults'] = (String resultsJson) {
        try {
          final decodedResults = jsonDecode(resultsJson);
          if (decodedResults is Map<String, dynamic>) {
             setState(() {
              _poseResults = decodedResults;
              _isCameraInitialized = true;
            });
          } else {
             print('Received non-map results: $resultsJson');
          }
        } catch (e) {
          print('Error decoding pose results: $e');
        }
      };
      // JS에서 pose detection 시작
      // pose_bridge.js에 정의된 startPoseDetection 함수 호출
      js.context.callMethod('startPoseDetection');
    });

  }

  @override
  void dispose() {
    // 웹 환경에서 JS 리소스 정리 (필요시)
    // 예: 비디오 엘리먼트 제거, 포즈 디텍터 중지 등
    js.context.callMethod('stopPoseDetection');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 웹 특정 UI: show analysis results over a transparent background (camera feed is in HTML body)
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.exerciseType} 운동'),
      ),
      body: Stack(
        children: [
          // 카메라 피드가 HTML에서 표시되므로 여기서는 투명한 컨테이너만 사용
          Container(color: Colors.transparent),
          
          // 분석 결과 표시
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '자세 분석 결과',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (!_isCameraInitialized)
                    const Text(
                      '카메라 초기화 중...\n카메라 접근 권한을 허용해주세요.',
                      style: TextStyle(color: Colors.white),
                    )
                  else if (_poseResults == null)
                    const Text(
                      '자세를 감지하는 중...',
                      style: TextStyle(color: Colors.white),
                    )
                  else
                    ..._poseResults!.entries.map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${entry.key}: ${entry.value}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 웹 플랫폼용 State 생성 함수
State<ExerciseScreen> createExerciseScreenState() => ExerciseScreenStateWeb();