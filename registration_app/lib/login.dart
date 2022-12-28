import 'package:flutter/material.dart';
import 'package:registration_app/Register.dart';
import 'package:registration_app/registration.dart';
import 'package:intl/intl.dart';
import 'database.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required String title}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  String CurrentDate1 = DateFormat("yyyy-MM-dd").format(DateTime.now());
  Future<void> getCurrent1(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    if (date != null) {
      setState(() {
        CurrentDate1 = DateFormat("yyyy-MM-dd").format(date);
      });
    }
  }

  final formKey = GlobalKey<FormState>();

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  void initState() {
    super.initState();
  }

  late DatabaseHandler handler;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 50),
          Text(
            "Welcome User",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text("Please enter your details"),
          SizedBox(height: 20),
          Text(
            "Name",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              labelText: 'Enter your name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Name Required";
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Birth Date",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  CurrentDate1,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 255, 102, 0),
                      ),
                      onPressed: () {
                        getCurrent1(context);
                      },
                    ))
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Email Id",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextFormField(
            validator: (value) {
              if (!isEmail(value.toString())) {
                return "Invalid Email Id";
              }
            },
            controller: email,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5)),
              labelText: 'Enter your Email Id',
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  this.handler = DatabaseHandler();
                  this.handler.initializeDB().whenComplete(() async {
                    await this.users();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registration()));
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 102, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 187, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Registration()));
              },
              child: const Text(
                'Show Data',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ]),
      ),
    ))));
  }

  Future<int> users() async {
    Register UserDetails = Register(
      // id: ,
      name: name.text,
      date: CurrentDate1,
      email: email.text,
    );

    List<Register> DetailsOfUsers = [
      UserDetails,
    ];
    return await this.handler.insertRegister(DetailsOfUsers);
  }
}
