import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

import 'animation/home.dart';

class PDFView extends StatefulWidget {
  PDFView({this.asset, this.title});

  final String title;
  final String asset;

  @override
  State<PDFView> createState() {
    return _PDFState(asset, title);
  }
}

class _PDFState extends State<PDFView> {
  _PDFState(String this.asset, String this.title);

  final String title;
  final String asset;

  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    getFileFromAsset(asset).then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PDFScreen(pathPDF, title)));
        });
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);

      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

//  @override
//  Widget build(BuildContext context) {
//    FutureBuilder(
//        future:
//            Future.value(getFileFromAsset("pdfs/essentialOils.pdf").then((f) {
//      setState(() {
//        pathPDF = f.path;
//        print(pathPDF);
//      });
//    })),
//    builder: (context),
//    );

//    returnPDF();
//
//    return Container(
//      color: Colors.red,
//
//    );
//  }
//
//  returnPDF() {
//    bool test = true;
//    while (test == true) {
//      if (pathPDF == ''){
//        print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//      } else {
//        test = false;
//        print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
//      }
//
//    }
//  }

  @override
  Widget build(BuildContext context) {
    print(pathPDF);
    return Container(
      color: Color.fromRGBO(21, 57, 112, 1)
//      child: Container(
//          margin: EdgeInsets.only(top: 200, left: 100, right: 100,
//          bottom: 200),
//          child: CircularProgressIndicator()),
    );
//    PDFViewerScaffold(
//        appBar: AppBar(
//          title: Text("text"),
//        ),
//        path: pathPDF);
//    Scaffold(
//      appBar: AppBar(title: const Text('Plugin example app')),
//      body: Center(
//        child: RaisedButton(
//          child: Text("Open PDF"),
//          onPressed: () => Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
//              ),
//        ),
//      ),
//    );
  }
}

////
class PDFScreen extends StatelessWidget {
  String pathPDF = "";

  PDFScreen(this.pathPDF, this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: PDFViewerScaffold(
          appBar: AppBar(backgroundColor: Color.fromRGBO(21, 57, 112, 1),
              title: Text(title),
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  })),
          path: pathPDF),
    );
  }

  _onBackPressed(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AnimationDemoHome()));
    });
  }
}
