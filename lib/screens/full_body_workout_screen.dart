import 'package:flutter/material.dart';
import 'package:fit_buddy_new/screens/workout_start_screen.dart';

class FullBodyWorkoutScreen extends StatelessWidget {
  const FullBodyWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('전신 운동'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '전신 운동 프로그램',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '다음 운동들을 순서대로 진행해주세요:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: Text('스쿼트'),
                    subtitle: Text('3세트 x 15회'),
                  ),
                  ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: Text('푸시업'),
                    subtitle: Text('3세트 x 10회'),
                  ),
                  ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: Text('플랭크'),
                    subtitle: Text('3세트 x 30초'),
                  ),
                  ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: Text('런지'),
                    subtitle: Text('3세트 x 12회'),
                  ),
                  ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: Text('마운틴 클라이머'),
                    subtitle: Text('3세트 x 20회'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkoutStartScreen(area: '전신'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('운동 시작하기', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
} 