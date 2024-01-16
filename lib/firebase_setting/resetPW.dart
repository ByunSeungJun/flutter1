import 'package:flutter1/firebase_setting/InsertPW.dart';
import 'package:flutter1/firebase_setting/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/firebase_setting/searchID.dart';
class resetPW extends StatefulWidget {
  const resetPW({super.key});
  @override
  State<resetPW> createState()=>_ResetScreenState();
}

class _ResetScreenState extends State<resetPW> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _certificationController = TextEditingController();


  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _certificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      // 뒤로가기 버튼이 눌렸을 때의 동작
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      return false; // 뒤로가기 동작을 막습니다.
    },
    child: Scaffold(
    appBar: AppBar(
    title: Text('PW 재설정'),
    centerTitle: true,
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    },
    ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child:Image.asset('assets/images/fineplaylogo.PNG', height: 120, width: 120
                )
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    child: OutlinedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              searchID()),
                        );
                      },

                      child: Text("ID 찾기"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    child: OutlinedButton(
                      onPressed: () async {

                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue), // 외곽선 색상
                        backgroundColor: Colors.grey, // 버튼 배경색
                      ),
                      child: Text("PW 재설정"),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'ID(이메일 형식) 입력'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('이메일 인증'),
                      content: Text('입력된 이메일로 인증번호를 보냈습니다!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // 다이얼로그 닫기
                            Navigator.of(context).pop();
                          },
                          child: Text('확인'),
                        ),
                      ],
                    );
                  },
                  );
                },
                child: Text('이메일 인증'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    child: TextField(
                      controller: _certificationController,
                      decoration: InputDecoration(hintText: '인증번호'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    child: OutlinedButton(
                      onPressed: () async {
                        if (_certificationController.text.isEmpty) {
                          print('입력 필요');
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InsertPW()),
                        );
                      },

                      child: Text("인증"),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              // InkWell을 사용하여 터치 이벤트 처리
              onTap: () {
                // Text를 클릭하면 두 번째 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                '로그인페이지로이동',
                style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
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