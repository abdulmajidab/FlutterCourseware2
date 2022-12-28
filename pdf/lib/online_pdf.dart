import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

String dropdownvalue = '1';
var page = ['3', '5', '12', '14'];

class online_pdf extends StatefulWidget {
  const online_pdf({super.key});

  @override
  State<online_pdf> createState() => _homeState();
}

class _homeState extends State<online_pdf> {
  late PdfViewerController pdfViewerController;
  final GlobalKey<SfPdfViewerState> pdfViwerStateKey = GlobalKey();

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
              actions: [
                IconButton(
                  onPressed: (() {
                    pdfViewerController.jumpToPage(6);
                  }),
                  icon: Icon(Icons.book_online),
                ),
                IconButton(
                  onPressed: (() {
                    pdfViwerStateKey.currentState!.openBookmarkView();
                  }),
                  icon: Icon(Icons.bookmark),
                ),
                DropdownButton(
                  items: page.map((String page) {
                    return DropdownMenuItem(
                      value: page,
                      child: Text(page),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                )
              ],
            ),
            body: 
            SfPdfViewer.asset(
              "assets/quran.pdf",
              controller: pdfViewerController,
              key: pdfViwerStateKey,
            )));
  }
}
