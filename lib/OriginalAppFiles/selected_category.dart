import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../PDFView.dart';
import '../WebView.dart';
import 'Data.dart';
import 'Item.dart';
import 'QRS.dart';
import 'ScrollBehavior.dart';
import 'list_builder.dart';

class selected_category extends StatefulWidget {
  selected_category(
      {this.passedMenuOptions,
      this.passedProtocolName,
      this.passedTitle,
      this.passedProtocolRoute});

  final List<MenuItem> passedMenuOptions;
  final String passedProtocolName;
  final String passedTitle;
  final String passedProtocolRoute;

  @override
  State<selected_category> createState() {
    return ListStateGut(passedMenuOptions, passedProtocolName, passedTitle,
        passedProtocolRoute);
  }
}


double screenWidth;
double screenHeight;

double screenWidthMultiplyer;
double screenHeightMultiplyer;



class ListStateGut extends State<selected_category> {
  ListStateGut(
      List<MenuItem> this.passedMenuOptions,
      String this.passedProtocolName,
      String this.passedTitle,
      this.passedProtocolRoute);

  final List<MenuItem> passedMenuOptions;
  final String passedProtocolName;
  final String passedTitle;
  final String passedProtocolRoute;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  addExtraCategoryBtn() {
    if (passedTitle == 'QRS') {
      return Container(
        height: screenHeightMultiplyer * 10,
        margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(CategoryRadius)),
          // Box decoration takes a gradient
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.all(Radius.circular(CategoryRadius)),
              border: Border.all(color: lightBlue, width: 3)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(CategoryRadius)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QRS(
                            passedList: QRSlist,
                          )),
                );
              },
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: screenHeightMultiplyer * 4),
                  child: AutoSizeText(
                      'QRS Setting Suggestions',
                      minFontSize: 20,
                      maxFontSize: 70,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 55,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-0.1, -0.1),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(0.1, -0.1),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(0.1, 0.1),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-0.1, 0.1),
                              color: Colors.black),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (passedTitle == 'Gut Check Test') {
      return Container(
        height: screenHeightMultiplyer * 10,
        margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(CategoryRadius)),
          // Box decoration takes a gradient
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.all(Radius.circular(CategoryRadius)),
              border: Border.all(color: lightBlue, width: 3)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(CategoryRadius)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LevelThree(
                          procedure: "Test Instructions",
                          passedList: GutCheckProtocol)),
                );
              },
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: screenHeightMultiplyer * 4),
                  child: AutoSizeText('Test Instructions',
                      minFontSize: 20,
                      maxFontSize: 70,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 55,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-0.1, -0.1),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(0.1, -0.1),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(0.1, 0.1),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-0.1, 0.1),
                              color: Colors.black),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Color darkBlue = Color.fromRGBO(21, 57, 112, 1);
  Color lightBlue = Color.fromRGBO(35, 78, 142, 1);
  Color green = Color.fromRGBO(90, 177, 106, 1);

  double CategoryRadius = 20;
  double ProtocolRadius = 80;

  double selectionHeight = 65;

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;

    screenWidthMultiplyer = screenWidth / 100;
    screenHeightMultiplyer = screenHeight / 100;

    if (isLandscape == true) {
      screenWidthMultiplyer = screenWidth / 60;
      screenHeightMultiplyer = screenHeight / 60;
    } else {
      screenWidthMultiplyer = screenWidth / 100;
      screenHeightMultiplyer = screenHeight / 100;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(passedTitle),
        backgroundColor: Color.fromRGBO(35, 78, 142, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/listbackground.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            addExtraCategoryBtn(),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                    itemCount: passedMenuOptions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: screenHeightMultiplyer * 10,
                        margin:
                            EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(CategoryRadius)),
                          // Box decoration takes a gradient
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: darkBlue,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(CategoryRadius)),
                              border: Border.all(color: lightBlue, width: 3)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(CategoryRadius)),
                              onTap: () {
                                if (passedTitle == "Training Videos") {
//                                _launchURL('${passedMenuOptions[index].menuLink}');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebViewRoute(
                                              url:
                                                  '${passedMenuOptions[index].menuLink}',
                                              appBrTitle:
                                                  '${passedMenuOptions[index].menuOption}',
                                            )),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDFView(
                                              asset:
                                                  '${passedMenuOptions[index].menuLink}',
                                              title:
                                                  '${passedMenuOptions[index].menuOption}',
                                              // appBrTitle: passedMenuOptions[index].menuOption,
                                              // appBrTitle: passedMenuOptions[index].menuOption,
                                            )),
                                  );
                                }
                              },
                              child: Center(
                                  child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxHeight: screenHeightMultiplyer * 4),
                                    child: AutoSizeText(
                                '${passedMenuOptions[index].menuOption}',
                                minFontSize: 20,
                                maxFontSize: 70,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 55.0,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          // bottomLeft
                                          offset: Offset(-0.1, -0.1),
                                          color: Colors.black),
                                      Shadow(
                                          // bottomRight
                                          offset: Offset(0.1, -0.1),
                                          color: Colors.black),
                                      Shadow(
                                          // topRight
                                          offset: Offset(0.1, 0.1),
                                          color: Colors.black),
                                      Shadow(
                                          // topLeft
                                          offset: Offset(-0.1, 0.1),
                                          color: Colors.black),
                                    ],
                                ),
                              ),
                                  )),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
