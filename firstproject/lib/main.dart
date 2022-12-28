import 'package:firstproject/button.dart';
import 'package:firstproject/home.dart';
import 'package:firstproject/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue),
        home: const Loginpage());
  }
}

// class moq extends StatelessWidget {
//   const moq({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//     )
    
//   }
// }

// class moq1 extends StatefulWidget {
//   const moq1({Key? key}) : super(key: key);

//   @override
//   State<moq1> createState() => _moq1State();
// }

// class _moq1State extends State<moq1> {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }

