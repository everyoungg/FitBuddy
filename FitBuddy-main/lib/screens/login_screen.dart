import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
          decoration: const BoxDecoration(color: Color(0xFFE2F3FF)),
          child: Stack(
            children: [
              Positioned(
                left: screenWidth * (75 / 1280),
                top: screenHeight * (49 / 844),
                child: Container(
                  width: screenWidth * (138 / 1280),
                  height: screenHeight * (138 / 844),
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
              // 아이디 입력 영역
              Positioned(
                left: screenWidth * (269 / 1280),
                top: screenHeight * (260 / 844),
                child: Container(
                  width: screenWidth * (771 / 1280),
                  height: screenHeight * (69 / 844),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * (300 / 1280),
                top: screenHeight * (276 / 844),
                child: Text(
                  '아이디',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * (32 / 844),
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * (422 / 1280),
                top: screenHeight * (276 / 844),
                child: SizedBox(
                  width: screenWidth * (551 / 1280),
                  height: screenHeight * (43 / 844),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 1280), vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: '아이디를 입력하세요',
                    ),
                    style: TextStyle(fontSize: screenHeight * (20 / 844)),
                  ),
                ),
              ),
              // 비밀번호 입력 영역
              Positioned(
                left: screenWidth * (269 / 1280),
                top: screenHeight * (362 / 844),
                child: Container(
                  width: screenWidth * (771 / 1280),
                  height: screenHeight * (69 / 844),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * (290 / 1280),
                top: screenHeight * (375 / 844),
                child: Text(
                  '비밀번호',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * (32 / 844),
                    fontFamily: 'Paytone One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * (422 / 1280),
                top: screenHeight * (375 / 844),
                child: SizedBox(
                  width: screenWidth * (551 / 1280),
                  height: screenHeight * (43 / 844),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 1280), vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: '비밀번호를 입력하세요',
                    ),
                    style: TextStyle(fontSize: screenHeight * (20 / 844)),
                  ),
                ),
              ),
              // 오른쪽 하단 이미지
              Positioned(
                left: screenWidth * (1055 / 1280),
                top: screenHeight * (490 / 844),
                child: Container(
                  width: screenWidth * (259 / 1280),
                  height: screenHeight * (259 / 844),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage("https://placehold.co/259x259"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // 로그인 버튼 추가 (아래쪽에 배치)
              Positioned(
                left: screenWidth * (269 / 1280),
                top: screenHeight * (700 / 844),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    width: screenWidth * (771 / 1280),
                    height: screenHeight * (69 / 844),
                    decoration: ShapeDecoration(
                      color: Color(0xFFB4EBF6),
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