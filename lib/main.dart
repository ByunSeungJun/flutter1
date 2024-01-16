
import 'package:flutter1/firebase_setting/mainlogin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MylogApp());
}

class MylogApp extends StatelessWidget {
  const MylogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Auth App',
      home: Mainlogin(),
    );
  }
}





