import 'package:flutter/material.dart';

class ShoulderWorkoutScreen extends StatelessWidget {
  const ShoulderWorkoutScreen({super.key});

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
                          '어깨',
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
            // 파이크 푸시업 (상단)
            Positioned(
              left: screenWidth * (428 / 1280),
              top: screenHeight * (256 / 832),
              child: GestureDetector(
                onTap: () {
                  // TODO: 파이크 푸시업 운동 상세 화면으로 이동
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
                      '파이크 푸시업',
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
            // 덤벨 프론트 레이즈 (중간)
            Positioned(
              left: screenWidth * (428 / 1280),
              top: screenHeight * (410 / 832),
              child: GestureDetector(
                onTap: () {
                  // TODO: 덤벨 프론트 레이즈 운동 상세 화면으로 이동
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
                      '덤벨 프론트 레이즈',
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
            // 벽 Y 레이즈 (하단)
            Positioned(
              left: screenWidth * (429 / 1280),
              top: screenHeight * (564 / 832),
              child: GestureDetector(
                onTap: () {
                  // TODO: 벽 Y 레이즈 운동 상세 화면으로 이동
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
                      '벽 Y 레이즈',
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