import 'package:flutter/material.dart';
import 'user_info_screen.dart';
import 'purpose_select_screen.dart';
import 'workout_categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _goToSettings(BuildContext context) async {
    // 개인정보 입력 화면으로 이동 후, 완료 시 운동목적 선택 화면으로 이동
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserInfoScreen()),
    );
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PurposeSelectScreen()),
    );
  }

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
              top: -12,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Color(0xFFE2F3FF)),
                child: Stack(
                  children: [
                    // 운동 차트 영역
                    Positioned(
                      left: screenWidth * (82 / 1280),
                      top: screenHeight * (283 / 832),
                      child: Container(
                        width: screenWidth * (242.55 / 1280),
                        height: screenHeight * (237 / 832),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '운동 n일차\n몸무게 추이',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontFamily: 'Paytone One',
                              fontWeight: FontWeight.w400,
                              height: 1.14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 상단 이미지
                    Positioned(
                      left: screenWidth * (180 / 1280),
                      top: screenHeight * (70 / 832),
                      child: Container(
                        width: screenWidth * (169.70 / 1280),
                        height: screenHeight * (166 / 832),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/170x166.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // 환영 메시지
                    Positioned(
                      left: screenWidth * (346 / 1280),
                      top: screenHeight * (111 / 832),
                      child: SizedBox(
                        width: screenWidth * (523 / 1280),
                        height: screenHeight * (84 / 832),
                        child: const Text(
                          '어서오세요!\n000님, 오늘 운동도 화이팅!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF223456),
                            fontSize: 30,
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                            height: 1.33,
                          ),
                        ),
                      ),
                    ),
                    // 하단 버튼들 - 텍스트로 변경
                    Positioned(
                      left: screenWidth * (33 / 1280),
                      top: screenHeight * (777 / 832),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WorkoutCategoriesScreen()),
                          );
                        },
                        child: SizedBox(
                          width: screenWidth * (232 / 1280),
                          height: screenHeight * (67 / 832),
                          child: const Text(
                            '운동하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontFamily: 'Paytone One',
                              fontWeight: FontWeight.w400,
                              height: 1.11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * (495 / 1280),
                      top: screenHeight * (777 / 832),
                      child: GestureDetector(
                        onTap: () {
                          // TODO: 챗봇상담 화면으로 이동
                        },
                        child: SizedBox(
                          width: screenWidth * (238 / 1280),
                          height: screenHeight * (63 / 832),
                          child: const Text(
                            '챗봇상담',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontFamily: 'Paytone One',
                              fontWeight: FontWeight.w400,
                              height: 1.11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: screenWidth * (963 / 1280),
                      top: screenHeight * (774 / 832),
                      child: GestureDetector(
                        onTap: () => _goToSettings(context),
                        child: SizedBox(
                          width: screenWidth * (221 / 1280),
                          height: screenHeight * (55 / 832),
                          child: const Text(
                            '설정',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontFamily: 'Paytone One',
                              fontWeight: FontWeight.w400,
                              height: 1.11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 