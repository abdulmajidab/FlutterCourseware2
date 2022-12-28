import 'package:firstproject/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class button1 extends StatelessWidget {
  const button1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        FittedBox(
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              "images/bg.jpg",
            ),
          ),
          fit: BoxFit.fill,
        ),
        // Image.asset("images/bg.jpg",
        // fit: BoxFit.fill,
        // ),
        Center(
            child: ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast(msg: "Welcome");
            Navigator.push(
                // Navigator.pushReplacement
                context,
                MaterialPageRoute(builder: (context) => Home()));
          },
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          // ignore: prefer_const_constructors
          child: Text(
            "Tap to Start",
          ),
        )),
      ],
    ));
  }
}
