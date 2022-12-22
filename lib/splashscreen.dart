import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72200424/home.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({super.key, required this.title});

  final String title;

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
    StartSplashScreen() async{
      var duration = const Duration(seconds:2);
      return Timer (duration, (){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyApp()));
      });
    }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
              backgroundColor: Color(0xff7132ef),
              body: Center(
                  child : Text("Hallo"
                  )),
            );
          }
    @override
          void initState(){
        StartSplashScreen();
  }
}
