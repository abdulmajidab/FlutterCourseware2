import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdf/online_pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late PdfViewerController pdfViewerController;

  @override
  void initState() {
    pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("PDF"),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const online_pdf()));
                        },
                        child: const Icon(
                          Icons.picture_as_pdf,
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          pdfViewerController.jumpToPage(05);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const online_pdf()));
                        },
                        child: const Icon(
                          Icons.picture_as_pdf,
                          size: 35,
                        ),
                      ),
                      Text("jump to Page 05")
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )));
  }
}
