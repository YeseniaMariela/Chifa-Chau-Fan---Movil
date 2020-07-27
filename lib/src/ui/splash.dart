import 'package:chaufan/src/ui/home.dart';
import 'package:chaufan/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      image: new Image.asset('assets/images/store_logo.png', height:MediaQuery.of(context).size.height,),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      loaderColor: Constants.rojo3,
      navigateAfterSeconds: Home(),
    );
  }
}