import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:web3dart/web3dart.dart';

import '../constants/constants.dart';

class tokensConversion extends StatefulWidget {
  const tokensConversion({super.key});

  @override
  State<tokensConversion> createState() => _tokensConversionState();
}

class _tokensConversionState extends State<tokensConversion> {
  var apiUrl = "https://testnet-rpc.coinex.net/"; //Replace with your API
  var httpClient = Client();
  String? Walletbalance;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  String? InGameCoins;
  @override
  void initState() {
    getBalance();
    getInGameCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController amount = new TextEditingController();
    return Scaffold(
        key: _scaffoldkey,
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Wallet Balance: " +
                                  (Walletbalance ?? "-") +
                                  " TCET",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "In Game Coins: " + (InGameCoins ?? "-"),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Text("1 TCET = 100 In Game Coins",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: amount,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Wallet amount",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                        color: Colors.white,
                        child: Text("Convert Now"),
                        onPressed: () async {
                          if (amount.text != "") {
                            convertAmount(amount.text);
                          }
                        })
                  ],
                ),
              )
            ])));
  }

  convertAmount(var amount) async {
    EasyLoading.show();
    try {
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
            function: _contract.function("deposit"),
            parameters: [BigInt.from(int.parse(amount) * 100)],
          ),
          chainId: 53);
      getBalance();
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Coins converted successfully!",
        ),
      );
      setState(() {
        InGameCoins =
            (int.parse(InGameCoins ?? "0") + (int.parse(amount) * 100))
                .toString();
      });
      log("got response");
      log(response1.toString());
    } catch (e) {
      log("error occured");
      log(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future getInGameCoins() async {
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
      log("got response");
      log(response1.toString());
      setState(() {
        InGameCoins = response1[1].toString();
      });
    } catch (e) {
      log("error occured");
      log(e.toString());
    }
  }

  Future getBalance() async {
    setState(() {
      Walletbalance = null;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = prefs.getString("key") ?? "";
    var ethClient = Web3Client(apiUrl, httpClient);
    var credentials = await ethClient.credentialsFromPrivateKey(key);
    var balance = await ethClient.getBalance(credentials.address);
    log("got balance");
    log(balance.toString());

    setState(() {
      Walletbalance = (int.parse(balance
                  .toString()
                  .replaceAll("EtherAmount: ", "")
                  .replaceAll(" wei", "")
                  .substring(0, 7)) /
              10000)
          .toString();
    });
  }
}
