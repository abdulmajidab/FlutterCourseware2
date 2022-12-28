import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 222, 234, 247),
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30),
          child: Column(
            children: [
              Row(
                children: [ 
                  CircleAvatar(
                    backgroundImage: AssetImage("images/photo.png"),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Noor",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text("Khan"),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Govandi, Mumbai-53",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "8888888888",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.school),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Bcs(CS)",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "khan@gmail.com",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        

        bottomNavigationBar: new BottomNavigationBar(
          items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.abc_sharp),
          label: "Like"
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.abc_sharp),
          label: "Like"
          )
        ]
        
        ),
        
        );
  }
}
