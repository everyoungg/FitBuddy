import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 1280,
          height: 844,
          decoration: const BoxDecoration(color: Color(0xFFE2F3FF)),
          child: Stack(
            children: [
              // 프로필 이미지
              Positioned(
                left: 75,
                top: 49,
                child: Container(
                  width: 138,
                  height: 138,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage("https://placehold.co/138x138"),
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
                left: 269,
                top: 260,
                child: Container(
                  width: 771,
                  height: 69,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 276,
                child: Text(
                  '아이디',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 422,
                top: 276,
                child: SizedBox(
                  width: 551,
                  height: 43,
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
              // 비밀번호 입력 영역
              Positioned(
                left: 269,
                top: 362,
                child: Container(
                  width: 771,
                  height: 69,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 290,
                top: 375,
                child: Text(
                  '비밀번호',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Paytone One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 422,
                top: 375,
                child: SizedBox(
                  width: 551,
                  height: 43,
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
              // 오른쪽 하단 이미지
              Positioned(
                left: 1055,
                top: 490,
                child: Container(
                  width: 259,
                  height: 259,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage("https://placehold.co/259x259"),
                      fit: BoxFit.cover,
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