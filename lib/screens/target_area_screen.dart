import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:fit_buddy_new/screens/exercise_screen.dart';

class TargetAreaScreen extends StatefulWidget {
  const TargetAreaScreen({super.key});

  @override
  State<TargetAreaScreen> createState() => _TargetAreaScreenState();
}

class _TargetAreaScreenState extends State<TargetAreaScreen> {
  String? _selectedBodyPart;
  String? _selectedExercise;
  bool _isLoading = false;

  final List<String> _bodyParts = [
    '전신',
    '팔',
    '다리',
    '어깨',
    '복부',
    '가슴'
  ];

  final Map<String, List<String>> _exercises = {
    '전신': ['스쿼트', '런지', '플랭크'],
    '팔': ['푸시업', '덤벨 컬', '트라이셉스 익스텐션'],
    '다리': ['스쿼트', '런지', '레그 프레스'],
    '어깨': ['숄더 프레스', '레터럴 레이즈', '프론트 레이즈'],
    '복부': ['크런치', '플랭크', '레그 레이즈'],
    '가슴': ['푸시업', '벤치 프레스', '체스트 프레스']
  };

  Future<void> _startExercise() async {
    if (_selectedBodyPart == null || _selectedExercise == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('운동 부위와 종류를 선택해주세요')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final cameras = await availableCameras();
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseScreen(
            camera: cameras.first,
            exerciseType: _selectedExercise!,
            bodyPart: _selectedBodyPart!,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('카메라를 초기화하는데 실패했습니다')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('운동 부위 선택'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '운동할 부위를 선택하세요',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _bodyParts.map((bodyPart) {
                      return ChoiceChip(
                        label: Text(bodyPart),
                        selected: _selectedBodyPart == bodyPart,
                        onSelected: (selected) {
                          setState(() {
                            _selectedBodyPart = selected ? bodyPart : null;
                            _selectedExercise = null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  if (_selectedBodyPart != null) ...[
                    const SizedBox(height: 24),
                    const Text(
                      '운동 종류를 선택하세요',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _exercises[_selectedBodyPart]!.map((exercise) {
                        return ChoiceChip(
                          label: Text(exercise),
                          selected: _selectedExercise == exercise,
                          onSelected: (selected) {
                            setState(() {
                              _selectedExercise = selected ? exercise : null;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _startExercise,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('운동 시작하기'),
                  ),
                ],
              ),
            ),
    );
  }
} 