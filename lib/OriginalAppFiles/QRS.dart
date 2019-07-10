import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'QRS_item.dart';

class QRS extends StatefulWidget {
  QRS({this.passedList});

  final List<QRSobject> passedList;

  @override
  State<QRS> createState() {
    return ListState(passedList);
  }
}

double screenWidth;
double screenHeight;

double screenWidthMultiplyer;
double screenHeightMultiplyer;

class ListState extends State<QRS> {
  ListState(List<QRSobject> this.passedList);

  final List<QRSobject> passedList;
  Color AdarkBlue = Color.fromRGBO(21, 57, 112, 1);
  Color AlightBlue = Color.fromRGBO(35, 78, 142, 1);

  Color lightGreen = Color.fromRGBO(90, 177, 106, 1);



  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;

    screenWidthMultiplyer = screenWidth / 100;
    screenHeightMultiplyer = screenHeight / 100;

    if (isLandscape == true) {
      screenWidthMultiplyer = screenWidth / 70;
      screenHeightMultiplyer = screenHeight / 70;
    } else {
      screenWidthMultiplyer = screenWidth / 100;
      screenHeightMultiplyer = screenHeight / 100;
    }


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CV-HC Settings Suggestions'),
        backgroundColor: Color.fromRGBO(35, 78, 142, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,

            stops: [0.5, 1],
            colors: [
              AdarkBlue,
              AlightBlue,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: BorderDirectional(
                      bottom: BorderSide(
                          color: Color.fromRGBO(90, 177, 106, 1), width: 2))),
              width: screenWidth,
              height: screenHeightMultiplyer * 8.5,

              child: Center(
                child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      1: FractionColumnWidth(0.2),
                      2: FractionColumnWidth(.3)
                    },
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                              child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: screenHeightMultiplyer * 5),
                            child: AutoSizeText(
                              "Condition",
                              style: TextStyle(fontSize: 50, color: lightGreen),
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: screenHeightMultiplyer * 5),
                                child: AutoSizeText(
                            "Level",
                            style: TextStyle(fontSize: 50, color: lightGreen),
                          ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: screenHeightMultiplyer * 5),
                                child: AutoSizeText(
                            "Freq.",
                            style: TextStyle(fontSize: 50, color: lightGreen),
                          ),
                              )),
                        ),
                      ]),
                    ]),
              ),

//            child: Row(
//              children: <Widget>[
//                Expanded(
//
//                    child: Center(child: Text("Condition")),flex: 2,),
//                Expanded(child: Center(child: Text("Frequency")),flex: 1,),
//                Expanded(child: Center(child: Text("Level")),flex: 1,)
//              ],
//            ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: passedList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Table(
                          border: TableBorder(
                              horizontalInside:
                                  BorderSide(color: lightGreen, width: 2)),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.top,
                          columnWidths: {
                            1: FractionColumnWidth(0.2),
                            2: FractionColumnWidth(.3)
                          },
                          children: [
                            TableRow(children: [
                              wideWidget(passedList[index].disease),
                              mediumWidget(passedList[index].level),
                              smallWidget(passedList[index].duration)
                            ]),
                          ]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

wideWidget(String text) {
  return Container(
    margin: EdgeInsets.only(top: 8, left: 8, bottom: 8),
    padding: EdgeInsets.all(10),
    child: ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: screenHeightMultiplyer * 50),
      child: AutoSizeText(
        text,
        maxLines: 15,
        maxFontSize: 50,
        minFontSize: 17,
        style: TextStyle( color: Colors.white),
      ),
    ),
    decoration: BoxDecoration(
        color: Color.fromRGBO(35, 78, 142, 1),
        border: Border.all(color: Color.fromRGBO(90, 177, 106, 1)),
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

mediumWidget(String text) {
  return Container(
    margin: EdgeInsets.only(top: 8, left: 8, bottom: 8),
    padding: EdgeInsets.all(10),
    child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: screenHeightMultiplyer * 50),
          child: AutoSizeText(
            text,
            maxLines: 15,
            maxFontSize: 50,
            minFontSize: 17,
            style: TextStyle( color: Colors.white),
    ),
        )),
    decoration: BoxDecoration(
        color: Color.fromRGBO(35, 78, 142, 1),
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

smallWidget(String text) {
  return Container(
    margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
    padding: EdgeInsets.all(10),
    child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: screenHeightMultiplyer * 50),
          child: AutoSizeText(
            text,
            maxLines: 15,
            maxFontSize: 50,
            minFontSize: 17,
            style: TextStyle( color: Colors.white),
    ),
        )),
    decoration: BoxDecoration(
        color: Color.fromRGBO(35, 78, 142, 1),
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}
