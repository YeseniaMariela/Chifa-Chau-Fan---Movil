import 'package:flutter/material.dart';
import 'package:chaufan/src/ui/splash.dart';
import 'package:chaufan/src/utils/const.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      title: Constants.appName,
      routes: {

      },
    );
  }
}
