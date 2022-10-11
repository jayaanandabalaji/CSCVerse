import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:math';
import 'dart:ui' as ui show Image;
import 'package:cscchallenge/screens/homeScreen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:developer' as log;
import '../constants/constants.dart';

class changeCar extends StatefulWidget {
  const changeCar({super.key});

  @override
  State<changeCar> createState() => _changeCarState();
}

class _changeCarState extends State<changeCar> {
  var seletedColor = "white";
  List<String> purchasedColors = [];
  var apiUrl = "https://testnet-rpc.coinex.net/"; //Replace with your API
  var httpClient = Client();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  String? InGameCoins;
  @override
  void initState() {
    getInGameCoins();
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
                "assets/bg.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black12.withOpacity(0.6),
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(children: [
                    Row(children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => homeScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "In Game Coins: " + (InGameCoins ?? "-"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildImage(Colors.white),
                          buildImage(Colors.deepPurple),
                          buildImage(Colors.deepOrange),
                          buildImage(Colors.green),
                          buildImage(Colors.yellow),
                        ],
                      ),
                    ))
                  ]))
            ])));
  }

  getCoins(Color color) {
    if (color == Colors.deepPurple) {
      return "100";
    }
    if (color == Colors.deepOrange) {
      return "200";
    }
    if (color == Colors.green) {
      return "300";
    }
    if (color == Colors.yellow) {
      return "400";
    }
  }

  getBorderColor(Color color) {
    if (color == Colors.green && seletedColor == "green") {
      return Colors.green;
    }
    if (color == Colors.yellow && seletedColor == "yellow") {
      return Colors.green;
    }
    if (color == Colors.deepOrange && seletedColor == "deepOrange") {
      return Colors.green;
    }
    if (color == Colors.white && seletedColor == "white") {
      return Colors.green;
    }
    if (color == Colors.deepPurple && seletedColor == "deepPurple") {
      return Colors.green;
    }
    return Colors.white;
  }

  getStatusText(Color color) {
    if (color == Colors.white) {
      return "Free";
    }
    if (color == Colors.yellow && purchasedColors.contains("yellow")) {
      return "Purchased";
    }
    if (color == Colors.green && purchasedColors.contains("green")) {
      return "Purchased";
    }
    if (color == Colors.deepPurple && purchasedColors.contains("deepPurple")) {
      return "Purchased";
    }
    if (color == Colors.deepOrange && purchasedColors.contains("deepOrange")) {
      return "Purchased";
    }
    return "Purchase Now";
  }

  getMaterialButtonColor(Color color) {
    if (getStatusText(color) == "Purchase Now") {
      return Colors.orange;
    }
    return Colors.green;
  }

  getColorString(Color color) {
    if (color == Colors.green) {
      return "green";
    }
    if (color == Colors.yellow) {
      return "yellow";
    }
    if (color == Colors.white) {
      return "white";
    }
    if (color == Colors.deepPurple) {
      return "deepPurple";
    }
    if (color == Colors.deepOrange) {
      return "deepOrange";
    }
  }

  Widget buildImage(Color color) {
    return GestureDetector(
        onTap: () async {
          if (getStatusText(color) != "Purchase Now") {
            setState(() {
              seletedColor = getColorString(color);
            });
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("color", seletedColor);
          } else {
            showTopSnackBar(
              context,
              CustomSnackBar.info(
                backgroundColor: Colors.yellow,
                message: "Please purchase the car first",
              ),
            );
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all((kIsWeb) ? 20 : 0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: getBorderColor(color), width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (kIsWeb)
                  ExtendedImage.asset(
                    "assets/cars/white/34.png",
                    color: color,
                    colorBlendMode: BlendMode.modulate,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                if (!kIsWeb)
                  Expanded(
                      child: ExtendedImage.asset(
                    "assets/cars/white/34.png",
                    color: color,
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.contain,
                  )),
                if (kIsWeb)
                  SizedBox(
                    height: 20,
                  ),
                if (getStatusText(color) == "Purchase Now")
                  Text("${getCoins(color)} coins",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                if (kIsWeb)
                  SizedBox(
                    height: 20,
                  ),
                MaterialButton(
                    onPressed: () {
                      if (getStatusText(color) == "Purchase Now") {
                        purchaseColor(color);
                      }
                    },
                    color: getMaterialButtonColor(color),
                    child: Text(
                      getStatusText(color),
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ));
  }

  purchaseColor(Color color) async {
    EasyLoading.show();
    try {
      if (int.parse(getCoins(color)) <= int.parse(InGameCoins ?? "0")) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String key = prefs.getString("key") ?? "";
        var ethClient = Web3Client(apiUrl, httpClient);
        var credentials = await ethClient.credentialsFromPrivateKey(key);
        String _abiCode = SolidityContracts.contract;
        EthereumAddress _contractAddress =
            EthereumAddress.fromHex(SolidityContracts.contractAddress);
        DeployedContract _contract = DeployedContract(
            ContractAbi.fromJson(_abiCode, "metagame"), _contractAddress);
        var response1 = await ethClient.sendTransaction(
            credentials,
            Transaction.callContract(
              contract: _contract,
              from: credentials.address,
              function: _contract.function("purchaseColor"),
              parameters: [getColorString(color)],
            ),
            chainId: 53);

        var response2 = await ethClient.sendTransaction(
            credentials,
            Transaction.callContract(
              contract: _contract,
              from: credentials.address,
              function: _contract.function("withdraw"),
              parameters: [BigInt.from(int.parse(getCoins(color)))],
            ),
            chainId: 53);
        getInGameCoins();
        purchasedColors.add(getColorString(color));
        setState(() {});

        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: "purchased successfully!",
          ),
        );
        setState(() {
          InGameCoins =
              (int.parse(InGameCoins ?? "0") - int.parse(getCoins(color)))
                  .toString();
          seletedColor = getColorString(color);
        });
        prefs.setString("color", seletedColor);
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "Insufficient balance",
          ),
        );
      }
    } catch (e) {
      log.log("error occured");
      log.log(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future getInGameCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      seletedColor = prefs.getString("color") ?? "white";
    });
    EasyLoading.show();
    setState(() {
      InGameCoins = null;
    });
    try {
      var ethClient = Web3Client(apiUrl, httpClient);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String key = prefs.getString("key") ?? "";
      var credentials = await ethClient.credentialsFromPrivateKey(key);
      String _abiCode = SolidityContracts.contract;
      EthereumAddress _contractAddress =
          EthereumAddress.fromHex(SolidityContracts.contractAddress);
      DeployedContract _contract = DeployedContract(
          ContractAbi.fromJson(_abiCode, "metagame"), _contractAddress);
      var response1 = await ethClient.call(
          contract: _contract,
          function: _contract.function("accounts"),
          params: [credentials.address]);
      if (response1[2] != null && response1[2] != "") {
        setState(() {
          purchasedColors = response1[2].split(" ");
        });
      }
      setState(() {
        InGameCoins = response1[1].toString();
      });
    } catch (e) {
    } finally {
      EasyLoading.dismiss();
    }
  }
}
