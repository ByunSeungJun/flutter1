

import 'package:flutter1/firebase_setting/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/firebase_setting/searchID.dart';
class InsertPW extends StatefulWidget {
  const InsertPW({super.key});
  @override
  State<InsertPW> createState()=>_InsertPWScreen();
}

class _InsertPWScreen extends State<InsertPW> {
  TextEditingController _password2Controller = TextEditingController();
  TextEditingController _password3Controller = TextEditingController();


  void dispose() {
    _password2Controller.dispose();
    _password3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _password2Controller,
                decoration: InputDecoration(hintText: '변경할 PW 입력'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _password3Controller,
                decoration: InputDecoration(hintText: 'PW 재입력'),
              ),
            ),
           Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 8),
                child: OutlinedButton(
                  onPressed: () async {
                    if(_password2Controller.text.isEmpty||_password3Controller.text.isEmpty)
                    {
                      print("비밀번호가 입력되지 않았습니다.");
                      return;
                    }
                    if(_password2Controller.text!=_password3Controller.text)
                      {
                        print("재입력된 비밀번호가 다릅니다.");
                        return;
                      }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },

                  child: Text("재설정"),
                ),
              ),


          ],
        ),


      ),
    );
  }
  }
