import 'package:flutter/material.dart';
import 'package:flutter1/firebase_setting/home_screen.dart';
import 'package:flutter1/firebase_setting/login_screen.dart';
import 'package:flutter1/firebase_setting/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Mainlogin extends StatefulWidget {
  const Mainlogin({super.key});
  @override
  State<Mainlogin> createState()=>_MainLoginScreenState();
  }


class _MainLoginScreenState extends State<Mainlogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 로고 이미지
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child:Image.asset('assets/images/fineplaylogo.PNG', height: 120, width: 120
                )
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('카카오톡으로 로그인/시작'),
            ),

            SizedBox(height: 10),


            ElevatedButton(
          onPressed: () async {
            final _googleSignin = GoogleSignIn();
            final _googleAccount = await _googleSignin.signIn();

            if (_googleAccount != null) {
              final googleAuth = await _googleAccount.authentication;

              if (googleAuth.accessToken != null &&
                  googleAuth.idToken != null) {
                try {
                  await FirebaseAuth.instance.signInWithCredential(
                    GoogleAuthProvider.credential(
                      idToken: googleAuth.idToken,
                      accessToken: googleAuth.accessToken,
                    ),
                  );
                  print("등록 성공");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  print("에러발생");
                } catch (e) {
                  print('에러발생');
                }
              } else
                print("에러발생");
            } else
              print("에러발생");
          },
          child: Text('구글로 로그인/시작'),
        ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('네이버로 로그인/시작'),
            ),


      Row(
        children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );

                },
                child: Text('이메일로 로그인'),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: ElevatedButton(
              onPressed: () {


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );

              },
              child: Text('이메일로 가입'),
            ),
          ),

],
      )
            // 아이디 찾기 및 비밀번호 찾기

          ],
        ),
      ),
    );
  }
}