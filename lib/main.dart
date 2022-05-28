import 'package:flutter/material.dart';
import 'package:quize/quizeScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
        backgroundColor:Colors.black,
        body: SafeArea(
          child:Padding(
            padding:EdgeInsets.symmetric(horizontal: 10),
            child: QuizScreen(),
            ), 
          ),
      ),
    );
  }
}

