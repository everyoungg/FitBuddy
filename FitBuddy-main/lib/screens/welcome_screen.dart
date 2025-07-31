import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB4EBF6),
      body: Center(
        child: Container(
          width: 1280,
          height: 832,
          decoration: const BoxDecoration(
            color: Color(0xFFB4EBF6),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 1280,
                  height: 844,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC2E6FF),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 366,
                        top: 66,
                        child: SizedBox(
                          width: 528,
                          height: 113,
                          child: Text(
                            'Fit Buddy\n\nWelcome!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF223456),
                              fontSize: 36,
                              fontFamily: 'Paytone One',
                              fontWeight: FontWeight.w400,
                              height: 0.67,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 465,
                        top: 135,
                        child: Container(
                          width: 331,
                          height: 331,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://placehold.co/331x331"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 회원 가입 버튼
              Positioned(
                left: 436,
                top: 466,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  child: Container(
                    width: 390,
                    height: 74,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '회원 가입',
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
              // 로그인 버튼
              Positioned(
                left: 435,
                top: 592,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Container(
                    width: 390,
                    height: 74,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '로그인',
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
      ),
    );
  }
} 