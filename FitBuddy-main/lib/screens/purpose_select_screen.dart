import 'package:flutter/material.dart';
import 'home_screen.dart';

class PurposeSelectScreen extends StatelessWidget {
  const PurposeSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(color: Color(0xFFE2F3FF)),
        child: Stack(
          children: [
            // 상단 이미지
            Positioned(
              left: screenWidth * (584 / 1920),
              top: screenHeight * (51 / 1080),
              child: Container(
                width: screenWidth * (138 / 1920),
                height: screenHeight * (130 / 1080),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/138x130.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 제목
            Positioned(
              left: screenWidth * (489 / 1920),
              top: screenHeight * (202 / 1080),
              child: SizedBox(
                width: screenWidth * (516 / 1920),
                height: screenHeight * (50 / 1080),
                child: const Text(
                  '운동 목적을 선택해주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 31,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            // 건강증진 버튼
            Positioned(
              left: screenWidth * (215 / 1920),
              top: screenHeight * (300 / 1080),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (865 / 1920),
                  height: screenHeight * (70 / 1080),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '건강증진',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 체중 감량 버튼
            Positioned(
              left: screenWidth * (215 / 1920),
              top: screenHeight * (423 / 1080),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (865 / 1920),
                  height: screenHeight * (70 / 1080),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '체중 감량',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 벌크업 버튼
            Positioned(
              left: screenWidth * (215 / 1920),
              top: screenHeight * (540 / 1080),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (865 / 1920),
                  height: screenHeight * (70 / 1080),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '벌크업',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // 라인 정리 버튼
            Positioned(
              left: screenWidth * (215 / 1920),
              top: screenHeight * (659 / 1080),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * (865 / 1920),
                  height: screenHeight * (69 / 1080),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '라인 정리',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
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