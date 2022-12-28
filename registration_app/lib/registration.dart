import 'package:flutter/material.dart';
import 'package:registration_app/Register.dart';
import 'package:registration_app/database.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late DatabaseHandler handler;
  @override
  void initState() {
    this.handler = DatabaseHandler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 50),
          Text(
            "Registration Successful",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Your Details are Submitted successfully",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          FutureBuilder(
              future: this.handler.retrieveRegister(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Register>> snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                       DataTable(
                        border: TableBorder(
                          horizontalInside: BorderSide(color: Colors.black),
                          verticalInside: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                        ),
                        columns: [
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Birthday")),
                          DataColumn(label: Text("Email id")),
                          DataColumn(label: Text("Delete")),
                        ],
                        rows: List.generate(snapshot.data!.length, (index) {
                          return DataRow(cells: [
                            DataCell(Text( 
                              snapshot.data![index].name,
                            )),
                            DataCell(Text(
                              snapshot.data![index].date,
                            )),
                            DataCell(Text(
                              snapshot.data![index].email,
                            )),
                            DataCell(
                              IconButton(
                                  onPressed: () async {
                                    await this.handler.deleteRegister(
                                        snapshot.data![index].id!);
                                    setState(() {
                                      snapshot.data!
                                          .remove(snapshot.data![index]);
                                    });
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                super.widget));
                                  },
                                  icon: Icon(Icons.delete)),
                            )
                          ]);
                        }),
                      )
                      );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ]),
      ),
    )));
  }
}
