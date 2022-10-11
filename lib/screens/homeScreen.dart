import 'dart:developer';

import 'package:cscchallenge/screens/gameWebview.dart';
import 'package:extended_image/extended_image.dart';
import 'package:imageview360/imageview360.dart';
import 'package:cscchallenge/screens/changeCar.dart';
import 'package:cscchallenge/screens/tokensConversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  getColorString() {
    if (currentColor == "white") {
      return Colors.white;
    }
    if (currentColor == "yellow") {
      return Colors.yellow;
    }
    if (currentColor == "green") {
      return Colors.green;
    }
    if (currentColor == "deepPurple") {
      return Colors.deepPurple;
    }
    if (currentColor == "deepOrange") {
      return Colors.deepOrange;
    }
  }

  var currentColor = "white";
  List<ImageProvider> imageList = [];

  loadImaged() async {
    log("loading image");
    for (int i = 1; i <= 52; i++) {
      imageList.add(ExtendedImage.asset(
        "assets/cars/white/${i}.png",
        color: Colors.red,
        colorBlendMode: BlendMode.modulate,
      ).image);
    }
    setState(() {});
    log("loaded image");
  }

  setLocalSelectedColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentColor = prefs.getString("color") ?? "white";
    });
  }

  @override
  void initState() {
    setLocalSelectedColor();
    loadImaged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Image.asset(
              "assets/bg1.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/coinex.png",
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                                color: Colors.white,
                                child: Text("Exchange Coins"),
                                onPressed: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          tokensConversion()));
                                })
                          ],
                        ),
                        MaterialButton(
                            color: Colors.white,
                            child: Text("Change Car"),
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => changeCar()));
                            })
                      ],
                    ),
                  ),
                  Expanded(
                    child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            getColorString(), BlendMode.modulate),
                        child: ImageView360(
                          key: UniqueKey(),
                          imageList: imageList!,
                        )),
                  ),
                  MaterialButton(
                      color: Colors.white,
                      child: Text("Play Now"),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String? color = prefs.getString("color") ?? "white";
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => gameWebviewScreen(color)));
                      })
                ],
              ),
            )
          ])),
    );
  }
}
