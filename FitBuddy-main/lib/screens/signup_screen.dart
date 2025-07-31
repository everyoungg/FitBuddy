import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(color: Color(0xFFE2F3FF)),
                  child: Stack(
                    children: [
                      Positioned(
                        left: screenWidth * (75 / 1280),
                        top: screenHeight * (49 / 832),
                        child: Container(
                          width: screenWidth * (138 / 1280),
                          height: screenHeight * (138 / 832),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage("https://placehold.co/138x138.png"),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(width: 1),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (260 / 1280),
                        top: screenHeight * (100 / 832),
                        child: SizedBox(
                          width: screenWidth * (431 / 1280),
                          height: screenHeight * (42 / 832),
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenHeight * (40 / 832),
                              fontFamily: 'Paytone One',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      // 아이디 입력
                      Positioned(
                        left: screenWidth * (269 / 1280),
                        top: screenHeight * (216 / 832),
                        child: Container(
                          width: screenWidth * (771 / 1280),
                          height: screenHeight * (69 / 832),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (307 / 1280),
                        top: screenHeight * (235 / 832),
                        child: Text(
                          '아이디',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * (32 / 832),
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (439 / 1280),
                        top: screenHeight * (232 / 832),
                        child: SizedBox(
                          width: screenWidth * (521 / 1280),
                          height: screenHeight * (42 / 832),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '아이디를 입력하세요',
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      // 비밀번호 입력
                      Positioned(
                        left: screenWidth * (269 / 1280),
                        top: screenHeight * (321 / 832),
                        child: Container(
                          width: screenWidth * (771 / 1280),
                          height: screenHeight * (69 / 832),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (304 / 1280),
                        top: screenHeight * (338 / 832),
                        child: Text(
                          '비밀번호',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * (32 / 832),
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (439 / 1280),
                        top: screenHeight * (337 / 832),
                        child: SizedBox(
                          width: screenWidth * (521 / 1280),
                          height: screenHeight * (42 / 832),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '비밀번호를 입력하세요',
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      // 별명 입력
                      Positioned(
                        left: screenWidth * (269 / 1280),
                        top: screenHeight * (431 / 832),
                        child: Container(
                          width: screenWidth * (771 / 1280),
                          height: screenHeight * (69 / 832),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (320 / 1280),
                        top: screenHeight * (438 / 832),
                        child: Text(
                          '별명',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * (32 / 832),
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (439 / 1280),
                        top: screenHeight * (442 / 832),
                        child: SizedBox(
                          width: screenWidth * (521 / 1280),
                          height: screenHeight * (43 / 832),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '별명을 입력하세요',
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      // 성별 입력
                      Positioned(
                        left: screenWidth * (269 / 1280),
                        top: screenHeight * (539 / 832),
                        child: Container(
                          width: screenWidth * (771 / 1280),
                          height: screenHeight * (69 / 832),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (328 / 1280),
                        top: screenHeight * (552 / 832),
                        child: Text(
                          '성별',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * (32 / 832),
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (439 / 1280),
                        top: screenHeight * (552 / 832),
                        child: SizedBox(
                          width: screenWidth * (521 / 1280),
                          height: screenHeight * (42 / 832),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '성별을 입력하세요',
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      // 나이 입력
                      Positioned(
                        left: screenWidth * (269 / 1280),
                        top: screenHeight * (654 / 832),
                        child: Container(
                          width: screenWidth * (771 / 1280),
                          height: screenHeight * (69 / 832),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (328 / 1280),
                        top: screenHeight * (672 / 832),
                        child: Text(
                          '나이',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * (32 / 832),
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * (441 / 1280),
                        top: screenHeight * (671 / 832),
                        child: SizedBox(
                          width: screenWidth * (521 / 1280),
                          height: screenHeight * (42 / 832),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '나이를 입력하세요',
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      // 로그인 버튼
                      Positioned(
                        left: screenWidth * (269 / 1280),
                        top: screenHeight * (750 / 832),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Container(
                            width: screenWidth * (771 / 1280),
                            height: screenHeight * (69 / 832),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFB4EBF6),
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
                      // 오른쪽 하단 로그인 버튼
                      Positioned(
                        right: screenWidth * (40 / 1280),
                        bottom: screenHeight * (40 / 832),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Container(
                            width: screenWidth * (160 / 1280),
                            height: screenHeight * (55 / 832),
                            decoration: ShapeDecoration(
                              color: Color(0xFFB4EBF6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '로그인',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
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
            ],
          ),
        ),
      ),
    );
  }
} 