import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // ExerciseScreen 위젯에서 사용
import 'package:flutter/foundation.dart'; // kIsWeb 사용을 위해 필요

// 플랫폼별 State 구현 클래스를 조건부로 import
import 'exercise_screen_native.dart'
    if (dart.library.html) 'exercise_screen_web.dart';

// ExerciseScreen StatefulWidget 정의는 모든 플랫폼에서 동일하게 사용합니다.
class ExerciseScreen extends StatefulWidget {
  final CameraDescription? camera; // 웹에서는 사용되지 않을 수 있으므로 nullable
  final String exerciseType;
  final String bodyPart;

  const ExerciseScreen({
    Key? key,
    this.camera, // 웹에서는 optional
    required this.exerciseType,
    required this.bodyPart,
  }) : super(key: key);

  @override
  State<ExerciseScreen> createState() => createExerciseScreenState();
}