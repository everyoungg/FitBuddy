import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 1280,
          height: 832,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 1280,
                  height: 844,
                  decoration: const BoxDecoration(color: Color(0xFFE2F3FF)),
                  child: Stack(
                    children: [
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
                      Positioned(
                        left: 260,
                        top: 100,
                        child: SizedBox(
                          width: 431,
                          height: 42,
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: 'Paytone One',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      // 아이디 입력
                      Positioned(
                        left: 269,
                        top: 216,
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
                        left: 307,
                        top: 235,
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
                        left: 439,
                        top: 232,
                        child: SizedBox(
                          width: 521,
                          height: 42,
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
                        left: 269,
                        top: 321,
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
                        left: 304,
                        top: 338,
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
                        left: 439,
                        top: 337,
                        child: SizedBox(
                          width: 521,
                          height: 42,
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
                        left: 269,
                        top: 431,
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
                        left: 320,
                        top: 438,
                        child: Text(
                          '별명',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 439,
                        top: 442,
                        child: SizedBox(
                          width: 521,
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
                              hintText: '별명을 입력하세요',
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      // 성별 입력
                      Positioned(
                        left: 269,
                        top: 539,
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
                        left: 328,
                        top: 552,
                        child: Text(
                          '성별',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 439,
                        top: 552,
                        child: SizedBox(
                          width: 521,
                          height: 42,
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
                        left: 269,
                        top: 654,
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
                        left: 328,
                        top: 672,
                        child: Text(
                          '나이',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Paytone One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 441,
                        top: 671,
                        child: SizedBox(
                          width: 521,
                          height: 42,
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