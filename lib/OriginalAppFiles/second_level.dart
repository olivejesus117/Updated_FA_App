import 'package:flutter/material.dart';
import 'Data.dart';
import 'list_builder.dart';

class AvazziaSecondLevel extends StatefulWidget {
  @override
  State1 createState() {
    return State1();
  }
}

class State1 extends State<AvazziaSecondLevel> {
  Color lightBlueA = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueB = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueC = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueD = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueE = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueF = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueG = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueH = Color.fromRGBO(35, 78, 142, 1);
  Color lightBlueI = Color.fromRGBO(35, 78, 142, 1);

  Color darkBlue = Color.fromRGBO(21, 57, 112, 1);
  Color lightBlue = Color.fromRGBO(35, 78, 142, 1);
  Color green = Color.fromRGBO(90, 177, 106, 1);

  double unpressedHeightASM = 65.0;
  double unpressedHeightA = 65.0;
  double unpressedHeightRR = 65.0;
  double unpressedHeightCA = 65.0;

  double CategoryRadius = 20;
  double ProtocolRadius = 80;

  double selectionHeight = 65;

  bool showOptionsASM = false;
  bool showOptionsA = false;
  bool showOptionsRR = false;
  bool showOptionsCA = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);

//    double offsetASM;
//    double offsetSR;
//
//    if (screenHeight > 800) {
//      offsetASM = 950;
//      offsetSR = 300;
//    } else if (screenHeight > 750) {
//      offsetASM = 970;
//      offsetSR = 380;
//    } else if (screenHeight > 700) {
//      offsetASM = 1010;
//      offsetSR = 450;
//    } else if (screenHeight > 650) {
//      offsetASM = 1050;
//      offsetSR = 530;
//    } else if (screenHeight > 590) {
//      offsetASM = 1095;
//      offsetSR = 603;
//    } else {
//      offsetASM = 1150;
//      offsetSR = 653;
//    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Common Protocols'),
        backgroundColor: Color.fromRGBO(35, 78, 142, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/listbackground.png"),
                fit: BoxFit.fill)),
        child: ListView(
          children: <Widget>[
            Container(
              //height: unpressedHeight,
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(CategoryRadius)),
                ),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: unpressedHeightCA,
                      child: Center(
                        child: InkWell(
                          splashColor: Color.fromRGBO(0, 0, 100, 0),
                          onTap: () {
                            //unpressedHeight = 300.0;
                            showOptionsCA == false
                                ? showOptionsCA = true
                                : showOptionsCA = false;
                            showOptionsCA == true
                                ? unpressedHeightCA = 100
                                : unpressedHeightCA = 65;

                            setState(() {});
                          },
                          child: Center(
                            child: Text(
                              'Chronic and Acute Pain',
                              style: TextStyle(
                                fontSize: 19.0,
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
                          ),
                        ),
                      ),
                    ),
                    showOptionsCA == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin:
                                    EdgeInsets.only(left: 16.0, right: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueC,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueC = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                                passedList:
                                                    CarpalTunnelProtocol,
                                                procedure:
                                                    'Carpal Tunnel Protocol',
                                                // listHeight: offsetSR,
                                              )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueC =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                    "Carpal Tunnel Protocol",
                                    style:
                                        TextStyle(color: green, fontSize: 16),
                                  )),
                                ),
                              ),
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin: EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    bottom: 16.0,
                                    top: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueD,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueD = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                                passedList: SciaticaProtocol,
                                                procedure: 'Sciatica Protocol',
                                                // listHeight: offsetSR,
                                              )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueD =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                    "Sciatica Protocol",
                                    style:
                                        TextStyle(color: green, fontSize: 16),
                                  )),
                                ),
                              ),
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin: EdgeInsets.only(
                                    left: 16.0, right: 16.0, bottom: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueF,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueF = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                                passedList:
                                                    PlantarFasciitisProtocol,
                                                procedure:
                                                    'Plantar Fasciitis Protocol',
                                                // listHeight: offsetSR,
                                              )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueF =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                    "Plantar Fasciitis Protocol",
                                    style:
                                        TextStyle(color: green, fontSize: 16),
                                  )),
                                ),
                              ),
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin: EdgeInsets.only(
                                    left: 16.0, right: 16.0, bottom: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueG,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueG = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                                passedList: ElbowPainProtocol,
                                                procedure:
                                                    'Elbow Pain Protocol',
                                                // listHeight: offsetSR,
                                              )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueG =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                    "Elbow Pain Protocol",
                                    style:
                                        TextStyle(color: green, fontSize: 16),
                                  )),
                                ),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            ),
            Container(
              //height: unpressedHeight,
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(CategoryRadius)),
                ),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: unpressedHeightASM,
                      child: Center(
                        child: InkWell(
                          splashColor: Color.fromRGBO(0, 0, 100, 0),
                          onTap: () {
                            showOptionsASM == false
                                ? showOptionsASM = true
                                : showOptionsASM = false;
                            showOptionsASM == true
                                ? unpressedHeightASM = 100
                                : unpressedHeightASM = 65;

                            setState(() {});
                          },
                          child: Center(
                            child: Text(
                              'Anxiety/Stress/Migraine',
                              style: TextStyle(
                                fontSize: 19.0,
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
                          ),
                        ),
                      ),
                    ),
                    showOptionsASM == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 50,
                                //color: lightBlue,
                                //only add bottom edge inset to last option
                                margin: EdgeInsets.only(
                                    left: 16.0, right: 16.0, bottom: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueA,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueA = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                                passedList: LittleWingsProtocol,
                                                procedure:
                                                    'Anxiety/Stress/Migraine',
                                                // listHeight: (offsetASM),
                                              )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueA =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                    "Little Wings Protocol",
                                    style:
                                        TextStyle(color: green, fontSize: 16),
                                  )),
                                ),
                              ),
//                            Container(
//                              height: 75,
//                              margin: EdgeInsets.only(
//                                  top: 16.0,
//                                  left: 16.0,
//                                  right: 16.0,
//                                  bottom: 16.0),
//                              decoration: BoxDecoration(
//                                color: lightBlue,
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(10)),
//                              ),
//                              child: Center(
//                                  child: Text(
//                                "Placeholder Protocol",
//                                style: TextStyle(color: green, fontSize: 16),
//                              )),
//                            )
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            ),
            Container(
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(CategoryRadius)),
                ),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: unpressedHeightA,
                      child: Center(
                        child: InkWell(
                          splashColor: Color.fromRGBO(0, 0, 100, 0),
                          onTap: () {
                            //unpressedHeight = 300.0;
                            showOptionsA == false
                                ? showOptionsA = true
                                : showOptionsA = false;
                            showOptionsA == true
                                ? unpressedHeightA = 100
                                : unpressedHeightA = 65;

                            setState(() {});
                          },
                          child: Center(
                            child: Text(
                              'Aesthetic',
                              style: TextStyle(
                                fontSize: 19.0,
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
                          ),
                        ),
                      ),
                    ),
                    showOptionsA == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin:
                                    EdgeInsets.only(left: 16.0, right: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueB,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueB = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                                passedList: ScarRemovalProtocol,
                                                procedure:
                                                    'Scar Removal Protocol',
                                                //listHeight: offsetSR,
                                              )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueB =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                    "Scar Removal Protocol",
                                    style:
                                        TextStyle(color: green, fontSize: 16),
                                  )),
                                ),
                              ),
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin:
                                EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueH,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueH = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                            passedList: SixPoint,
                                            procedure:
                                            "Six-Point Face Protocol",
                                            //listHeight: offsetSR,
                                          )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueH =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                        "Six-Point Face Protocol",
                                        style:
                                        TextStyle(color: green, fontSize: 16),
                                      )),
                                ),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            ),
            Container(
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
                  borderRadius:
                      BorderRadius.all(Radius.circular(CategoryRadius)),
                ),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: unpressedHeightRR,
                      child: Center(
                        child: InkWell(
                          splashColor: Color.fromRGBO(0, 0, 100, 0),
                          onTap: () {
                            //unpressedHeight = 300.0;
                            showOptionsRR == false
                                ? showOptionsRR = true
                                : showOptionsRR = false;
                            showOptionsRR == true
                                ? unpressedHeightRR = 100
                                : unpressedHeightRR = 65;

                            setState(() {});
                          },
                          child: Center(
                            child: Text(
                              'Relax and Release',
                              style: TextStyle(
                                fontSize: 19.0,
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
                          ),
                        ),
                      ),
                    ),
                    showOptionsRR == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin:
                                    EdgeInsets.only(left: 16.0, right: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueE,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueE = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                                passedList: VagusDProtocol,
                                                procedure: 'Vagus D Protocol',
                                                // listHeight: offsetSR,
                                              )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueE =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                    "Vagus D Protocol",
                                    style:
                                        TextStyle(color: green, fontSize: 16),
                                  )),
                                ),
                              ),
                              Container(
                                height: 50,
                                //color: lightBlue,
                                margin:
                                EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                                decoration: BoxDecoration(
                                  color: lightBlueI,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ProtocolRadius)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    lightBlueI = Color.fromRGBO(8, 40, 90, 1);
                                    setState(() {});

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LevelThree(
                                            passedList: CoreWholeBody,
                                            procedure: 'Core Whole Body Protocol',
                                            // listHeight: offsetSR,
                                          )),
                                    );
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      lightBlueI =
                                          Color.fromRGBO(35, 78, 142, 1);

                                      setState(() {});
                                    });
                                  },
                                  splashColor: green,
                                  child: Center(
                                      child: Text(
                                        "Core Whole Body Protocol",
                                        style:
                                        TextStyle(color: green, fontSize: 16),
                                      )),
                                ),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
