import 'package:flutter/material.dart';

import 'animation/home.dart';


void main() => runApp(App());



//class AnimationDemo extends StatelessWidget {
//  const AnimationDemo({Key key}) : super(key: key);
//
//  static const String routeName = '/animation';
//
//  @override
//  Widget build(BuildContext context) => const AnimationDemoHome();
//}


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Alternatives',
      debugShowCheckedModeBanner: false,
      home: AnimationDemoHome(),
    );
  }
}
