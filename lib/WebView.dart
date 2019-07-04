import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_plugin.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class WebViewRoute extends StatefulWidget {
  WebViewRoute({this.url, this.appBrTitle});

  final String url;
  final String appBrTitle;

  @override
  StateWeb createState() {
    return StateWeb(url, appBrTitle);
  }
}

class StateWeb extends State<WebViewRoute> {
  StateWeb(String this.url, String this.appBrTitle);

  final String url;
  final String appBrTitle;

  Color darkBlue = Color.fromRGBO(21, 57, 112, 1);
  Color lightBlue = Color.fromRGBO(35, 78, 142, 1);
  Color green = Color.fromRGBO(90, 177, 106, 1);

//  WebViewController _controller;

_launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,

      appBar: AppBar(backgroundColor: darkBlue,title: Text(appBrTitle),
      ),withZoom: true,
//      body:
//      WebView(
//        initialUrl: url,
//        onWebViewCreated: (WebViewController webViewController) {
//          _controller = webViewController;
//          _controller.loadUrl(url);
//        },
//        javascriptMode: JavascriptMode.unrestricted,
////        gestureRecognizers: Set()
////          ..add(Factory<VerticalDragGestureRecognizer>(
////                  () => VerticalDragGestureRecognizer())),
//      )

//    _launchURL(url)



    );}
}

