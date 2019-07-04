// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app_sections/OriginalAppFiles/Data.dart';
import 'package:flutter_app_sections/OriginalAppFiles/QRS.dart';
import 'package:flutter_app_sections/OriginalAppFiles/list_builder.dart';
import 'package:flutter_app_sections/OriginalAppFiles/second_level.dart';
import 'package:flutter_app_sections/OriginalAppFiles/selected_category.dart';
import 'package:launch_review/launch_review.dart';
import '../PDFView.dart';
import '../WebView.dart';
import 'sections.dart';
import 'package:url_launcher/url_launcher.dart';


//_launchURL(String url) async {
//  if (await canLaunch(url)) {
//    return WebView(
//      initialUrl: url,
//    );
//  } else {
//    throw 'Could not launch $url';
//  }
//}

Color darkBlue = Color.fromRGBO(21, 57, 112, 1);

const double kSectionIndicatorWidth = 32.0;

// The card for a single section. Displays the section's gradient and background image.
class SectionCard extends StatelessWidget {
  const SectionCard({Key key, @required this.section})
      : assert(section != null),
        super(key: key);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: section.title,
      button: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              section.leftColor,
              section.rightColor,
            ],
          ),
        ),
        child: Image.asset(
          section.backgroundAsset,
          package: section.backgroundAssetPackage,
          color: const Color.fromRGBO(255, 255, 255, 0.075),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// The title is rendered with two overlapping text widgets that are vertically
// offset a little. It's supposed to look sort-of 3D.
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.section,
    @required this.scale,
    @required this.opacity,
  })  : assert(section != null),
        assert(scale != null),
        assert(opacity != null && opacity >= 0.0 && opacity <= 1.0),
        super(key: key);

  final Section section;
  final double scale;
  final double opacity;

  static const TextStyle sectionTitleStyle = TextStyle(
    fontFamily: 'Raleway',
    inherit: false,
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );

  static final TextStyle sectionTitleShadowStyle = sectionTitleStyle.copyWith(
    color: const Color(0x19000000),
  );

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: opacity,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 4.0,
                child: Text(section.title, style: sectionTitleShadowStyle),
              ),
              Text(section.title, style: sectionTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// Small horizontal bar that indicates the selected section.
class SectionIndicator extends StatelessWidget {
  const SectionIndicator({Key key, this.opacity = 1.0}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: kSectionIndicatorWidth,
        height: 3.0,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}

// Display a single SectionDetail.
class SectionDetailView extends StatelessWidget {
  SectionDetailView({Key key, @required this.detail})
      : assert(detail != null && detail.imageAsset != null),
        assert((detail.imageAsset ?? detail.buttonText) != null),
        super(key: key);

  final SectionDetail detail;

  @override
  Widget build(BuildContext context) {
    final Widget image = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        image: DecorationImage(
          image: AssetImage(
            detail.imageAsset,
            package: detail.imageAssetPackage,
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );

    Widget item;
    if (detail.buttonRoute.contains('pdfform')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFView(
                        asset: '${detail.passedData}',
                        title: '${detail.buttonText}',
//                            url: '${detail.buttonRoute}',
//                            appBrTitle: detail.buttonText,
                          )),
                );
                // _launchURL('${detail.buttonRoute}');
              },
              child: Center(
                  child: Text(
                detail.buttonText,
                style: TextStyle(color: darkBlue, fontSize: 18),
              )),
            ),
          ),

//        height: 240.0,
//        padding: const EdgeInsets.all(16.0),
//        child: SafeArea(
//          top: false,
//          bottom: false,
//          child: image,
//        ),
        ),
      );
    }else if (detail.buttonRoute.contains('http')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebViewRoute(
                            url: '${detail.buttonRoute}',
                            appBrTitle: detail.buttonText,
                      )),
                );
                // _launchURL('${detail.buttonRoute}');
              },
              child: Center(
                  child: Text(
                    detail.buttonText,
                    style: TextStyle(color: darkBlue, fontSize: 18),
                  )),
            ),
          ),

//        height: 240.0,
//        padding: const EdgeInsets.all(16.0),
//        child: SafeArea(
//          top: false,
//          bottom: false,
//          child: image,
//        ),
        ),
      );
    }
    else if (detail.passedData.contains('AvazziaSecondLevel')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AvazziaSecondLevel()),
                    );
                  },
                  child: Center(
                      child: Text(detail.buttonText,
                          style: TextStyle(color: darkBlue, fontSize: 18))))),
        ),
      );
    } else if (detail.passedData.contains('Training Videos')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => selected_category(
                                passedTitle: "Training Videos",
                                passedMenuOptions: AvazziaTrainingVideos,
                              )),
                    );
                  },
                  child: Center(
                      child: Text(detail.buttonText,
                          style: TextStyle(color: darkBlue, fontSize: 18))))),
        ),
      );
    } else if (detail.passedData.contains('Presentations')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => selected_category(
                                passedTitle: "Presentations",
                                passedMenuOptions: AvazziaPresentations,
                              )),
                    );
                  },
                  child: Center(
                      child: Text(detail.buttonText,
                          style: TextStyle(color: darkBlue, fontSize: 18))))),
        ),
      );
    } else if (detail.passedData.contains('Test Instructions')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
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
                      child: Text(detail.buttonText,
                          style: TextStyle(color: darkBlue, fontSize: 18))))),
        ),
      );
    } else if (detail.passedData.contains('QRSlist')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
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
                      child: Text(detail.buttonText,
                          style: TextStyle(color: darkBlue, fontSize: 18))))),
        ),
      );
    } else if (detail.passedData.contains('German to English')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LevelThree(
                              procedure: "German to English",
                              passedList: GermanToEnglish)),
                    );
                  },
                  child: Center(
                      child: Text(detail.buttonText,
                          style: TextStyle(color: darkBlue, fontSize: 18))))),
        ),
      );
    } else if (detail.passedData.contains('MDLive')) {
      item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 65,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkBlue, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(4),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    LaunchReview.launch(
                        androidAppId: "com.mdlive.mobile",
                        writeReview: false,
                        iOSAppId: "839671393");
                  },
                  child: Center(
                      child: Text(detail.buttonText,
                          style: TextStyle(color: darkBlue, fontSize: 18))))),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xFF353662)),
      child: item,
    );
  }
}
