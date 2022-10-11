import 'package:cscchallenge/screens/connectAccount.dart';
import 'package:cscchallenge/screens/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    splashMove();
  }

  splashMove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("key") != null) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => homeScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => connectAccount()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Loading..."),
    ));
  }
}
