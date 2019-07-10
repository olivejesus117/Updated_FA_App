import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Item.dart';

class LevelThree extends StatefulWidget {
  LevelThree({this.passedList, this.procedure, this.listHeight});

  final List<MessageItem> passedList;
  final String procedure;
  final double listHeight;

  @override
  State<LevelThree> createState() {
    return ListState(passedList, procedure, listHeight);
  }
}

class ListState extends State<LevelThree> {
  ListState(List<MessageItem> this.passedList, String this.procedure, double this.listHeight);

  final List<MessageItem> passedList;
  final String procedure;
  final double listHeight;

  double landscapePadding;
  double imageWidth;
  double buttonWidth;

  Color darkBlue = Color.fromRGBO(21, 57, 112, 1);
  Color lightBlue = Color.fromRGBO(35, 78, 142, 1);

  final controller = ScrollController();

  double screenWidth;
  double screenHeight;

  double fontsize;

  double cWidth = 0.0;
  double itemHeight = 100;
  int itemsCount;

  String currentURL;


  _launchURL() async {
    String url =
    currentURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  onScroll() {
    setState(() {
      cWidth = controller.offset * screenWidth / (listHeight);
    });
  }

//  @override
//  void dispose() {
//    controller.removeListener(onScroll);
//  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    if (isLandscape == true) {
      screenHeight = screenHeight * 1.5;
    } else {
    }

    if (screenHeight < 900){
      fontsize = 18;
    } else {
      fontsize = 55;
    }
//    double progressWidth;
//
//    if (cWidth >= 0) {
//      progressWidth = cWidth;
//    }else {
//      progressWidth = 0;
//    }

    itemsCount = passedList.length;

    String test = "";

    double ytHeight;

    if (passedList[0].playYoutube.isEmpty) {
      ytHeight = 0;
    } else {
      ytHeight = screenHeight/12;
    }

    if (isLandscape == true) {
      imageWidth = screenWidth * 0.5;
      landscapePadding = 32;
    } else {
      imageWidth = screenWidth;
      landscapePadding = 16;
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(procedure, style: TextStyle()),
        backgroundColor: Color.fromRGBO(35, 78, 142, 1),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          //padding: EdgeInsetsDirectional.only(
          //start: 32, end: 32, top: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//              Container(
//                color: Colors.green,
//                height: 5,
//                width: progressWidth,
//                child: InkWell(onTap: () {
//                  print(controller.offset);
//                }),
//              ),
              Expanded(
                child: ListView.separated(
                  controller: controller,
                  itemCount: passedList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Colors.black,
                        indent: 16,
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    int index1 = index;

                    if (!(test == '${passedList[index].heading}')) {
                      return Column(
                        children: <Widget>[
                          Container(
                            width: screenWidth,
                            height: ytHeight,
                            color: darkBlue,
                            padding: EdgeInsetsDirectional.only(
                                start: landscapePadding, end: 32),
                            child: Center(
                              child: InkWell(
                                splashColor: lightBlue,
                                onTap: () {
                                  currentURL = passedList[0].url;
                                  print(currentURL);
                                  _launchURL();
                                  darkBlue = lightBlue;
                                  setState(() {});
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    darkBlue = Color.fromRGBO(21, 57, 112, 1);

                                    setState(() {});
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: screenHeight/30
                                      ),
                                      child: AutoSizeText(
                                        '${passedList[index].playYoutube}',
                                        minFontSize: 18,
                                        maxFontSize: 70,
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 55,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsetsDirectional.only(
                                start: landscapePadding,
                                end: 32,
                                top: 26,
                                bottom: 16),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 22,
                                  foregroundColor:
                                      Color.fromRGBO(255, 255, 255, 1),
                                  backgroundColor:
                                      Color.fromRGBO(21, 57, 112, 1),
                                  child: Text(
                                    'i',
                                    style: new TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 16,end: 8),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxHeight: screenHeight/30
                                      ),
                                      child: AutoSizeText(
                                        '${passedList[index].heading}',
                                        minFontSize: 18,
                                        maxFontSize: 70,
                                        maxLines: 1,
                                        textAlign: TextAlign.start,
                                        style: new TextStyle(
                                          fontSize: 55,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else if ((test == '${passedList[index].heading}')) {
                      return Container(
                        padding: EdgeInsetsDirectional.only(
                            start: landscapePadding,
                            end: 16,
                            top: 16,
                            bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 22,
                              foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                              backgroundColor: Color.fromRGBO(90, 177, 106, 1),
                              child: Text(
                                '$index1',
                                style: new TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsetsDirectional.only(
                                    start: 16, end: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxHeight: screenHeight/3,
                                      ),
                                      child: AutoSizeText(
                                        '${passedList[index].direction}',
                                        minFontSize: 18,
                                        maxFontSize: 70,
                                        style: new TextStyle(
                                          fontSize: fontsize,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: imageWidth,
                                      padding: EdgeInsetsDirectional.only(
                                          top: 16, end: 16),
                                      child: Image(
                                        image:
                                            AssetImage(passedList[index].image),
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}


//class VideoApp extends StatefulWidget {
//  @override
//  _VideoAppState createState() => _VideoAppState();
//}
//
//class _VideoAppState extends State<VideoApp> {
//  VideoPlayerController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = VideoPlayerController.network(
//        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        Center(
//          child: _controller.value.initialized
//              ? AspectRatio(
//                  aspectRatio: _controller.value.aspectRatio,
//                  child: VideoPlayer(_controller),
//                )
//              : Container(),
//        ),
//        Container(
//          height: 50,
//          width: 50,
//          color: Colors.lightBlue,
//          child: InkWell(
//            onTap: () {
//              setState(() {
//                _controller.value.isPlaying
//                    ? _controller.pause()
//                    : _controller.play();
//              });
//            },
//            child: Icon(
//              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _controller.dispose();
//  }
//}
