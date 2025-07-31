import 'package:flutter/material.dart';
import 'arm_workout_screen.dart';
import 'leg_workout_screen.dart';
import 'shoulder_workout_screen.dart';
import 'abs_workout_screen.dart';
import 'chest_workout_screen.dart';
import 'fullbody_workout_screen.dart';

class WorkoutCategoriesScreen extends StatelessWidget {
  const WorkoutCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Color(0xFFC2E6FF)),
                child: Stack(
                  children: [
                    Positioned(
                      left: screenWidth * (76 / 1280),
                      top: screenHeight * (79 / 832),
                      child: SizedBox(
                        width: screenWidth * (531 / 1280),
                        height: screenHeight * (71 / 832),
                        child: const Text(
                          '원하는 운동 부위 선택',
                          style: TextStyle(
                            color: Color(0xFF5C5C5C),
                            fontSize: 40,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 팔 (왼쪽 상단)
            Positioned(
              left: screenWidth * (140 / 1280),
              top: screenHeight * (256 / 832),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ArmWorkoutScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (399 / 1280),
                  height: screenHeight * (82 / 832),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '팔',
                      style: TextStyle(
                        color: Color(0xFF221A1A),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 다리 (오른쪽 상단)
            Positioned(
              left: screenWidth * (752 / 1280),
              top: screenHeight * (256 / 832),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LegWorkoutScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (399 / 1280),
                  height: screenHeight * (82 / 832),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '다리',
                      style: TextStyle(
                        color: Color(0xFF221A1A),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 어깨 (왼쪽 중간)
            Positioned(
              left: screenWidth * (140 / 1280),
              top: screenHeight * (410 / 832),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShoulderWorkoutScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (399 / 1280),
                  height: screenHeight * (83 / 832),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '어깨',
                      style: TextStyle(
                        color: Color(0xFF221A1A),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 복부 (오른쪽 중간)
            Positioned(
              left: screenWidth * (753 / 1280),
              top: screenHeight * (413 / 832),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AbsWorkoutScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (398 / 1280),
                  height: screenHeight * (82 / 832),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '복부',
                      style: TextStyle(
                        color: Color(0xFF221A1A),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 가슴 (왼쪽 하단)
            Positioned(
              left: screenWidth * (141 / 1280),
              top: screenHeight * (564 / 832),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChestWorkoutScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (399 / 1280),
                  height: screenHeight * (82 / 832),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '가슴',
                      style: TextStyle(
                        color: Color(0xFF221A1A),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 전신 (오른쪽 하단)
            Positioned(
              left: screenWidth * (751 / 1280),
              top: screenHeight * (564 / 832),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FullbodyWorkoutScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (398 / 1280),
                  height: screenHeight * (82 / 832),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '전신',
                      style: TextStyle(
                        color: Color(0xFF221A1A),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 뒤로가기 버튼
            Positioned(
              left: screenWidth * (50 / 1920),
              top: screenHeight * (50 / 1080),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: screenWidth * (100 / 1920),
                  height: screenHeight * (50 / 1080),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '뒤로',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 