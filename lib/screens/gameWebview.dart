import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webviewx/webviewx.dart';

class gameWebviewScreen extends StatefulWidget {
  final color;
  const gameWebviewScreen(this.color);

  @override
  State<gameWebviewScreen> createState() => _gameWebviewScreenState();
}

class _gameWebviewScreenState extends State<gameWebviewScreen> {
  WebViewXController? webviewController;

  getColorHex() {
    if (widget.color == "white") {
      return "FFFFFF";
    }
    if (widget.color == "deepPurple") {
      return "570861";
    }
    if (widget.color == "deepOrange") {
      return "DD6E0F";
    }
    if (widget.color == "green") {
      return "00FF00";
    }
    if (widget.color == "yellow") {
      return "FFFF00";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: EasyWebView(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                src:
                    '''<iframe src="http://test4.digitalbloging.com/T3/index.html?color=${getColorHex()}&specular=${getColorHex()}" style="position:fixed; top:0; left:0; bottom:0; right:0; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;">
    Your browser doesn't support iframes
</iframe>''',

                isHtml: true, // Use Html syntax
                isMarkdown: false, // Use markdown syntax
                convertToWidgets: false, // Try to convert to flutter widgets
                // width: 100,
                // height: 100,
                onLoaded: () {},
              )),
          if (!kIsWeb)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTapDown: (TapDownDetails? details) async {
                              log("key down event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keydown', {'keyCode':65}));
  """);
                            },
                            onTapCancel: () async {
                              log("key cancel event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':65}));
  """);
                            },
                            onTapUp: (detail) async {
                              log("key tapped up");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':65}));
  """);
                            },
                            onTap: () {
                              log("tapped");
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: Color(0xffA8ADA9),
                                size: 100,
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTapDown: (TapDownDetails? details) async {
                              log("key down event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keydown', {'keyCode':68}));
  """);
                            },
                            onTapCancel: () async {
                              log("key cancel event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':68}));
  """);
                            },
                            onTapUp: (detail) async {
                              log("key tapped up");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':68}));
  """);
                            },
                            onTap: () {
                              log("tapped");
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Color(0xffA8ADA9),
                                size: 100,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTapDown: (TapDownDetails? details) async {
                              log("key down event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keydown', {'keyCode':83}));
  """);
                            },
                            onTapCancel: () async {
                              log("key cancel event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':83}));
  """);
                            },
                            onTapUp: (detail) async {
                              log("key tapped up");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':83}));
  """);
                            },
                            onTap: () {
                              log("tapped");
                            },
                            child:
                                Image.asset("assets/brake.png", height: 100)),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTapDown: (TapDownDetails? details) async {
                              log("key down event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keydown', {'keyCode':87}));
  """);
                            },
                            onTapCancel: () async {
                              log("key cancel event");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':87}));
  """);
                            },
                            onTapUp: (detail) async {
                              log("key tapped up");
                              await webviewController!.evalRawJavascript("""
    document.dispatchEvent(new KeyboardEvent('keyup', {'keyCode':87}));
  """);
                            },
                            onTap: () {
                              log("tapped");
                            },
                            child: Image.asset("assets/accelerator.png",
                                height: 100)),
                      ],
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
