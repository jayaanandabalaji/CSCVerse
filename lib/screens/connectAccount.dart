import 'dart:developer';

import 'package:cscchallenge/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

import '../constants/constants.dart';

class connectAccount extends StatefulWidget {
  const connectAccount({super.key});

  @override
  State<connectAccount> createState() => _connectAccountState();
}

class _connectAccountState extends State<connectAccount> {
  var apiUrl = "https://testnet-rpc.coinex.net/"; //Replace with your API
  var httpClient = Client();
  TextEditingController wallet = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
            color: Colors.black12.withOpacity(0.4),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: wallet,
                    decoration: InputDecoration(
                        hintText: "Wallet private key",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    color: Colors.white,
                    child: Text("Add Wallet"),
                    onPressed: () async {
                      EasyLoading.show();

                      try {
                        var ethClient = Web3Client(apiUrl, httpClient);
                        var credentials = await ethClient
                            .credentialsFromPrivateKey(wallet.text);
                        var balance =
                            await ethClient.getBalance(credentials.address);
                        log("got balance");
                        log(balance.toString());
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("key", wallet.text);
                        await connectAccountContract();
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => homeScreen()));
                      } catch (e) {
                        log("error occured");
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(
                            backgroundColor: Colors.yellow,
                            message: e.toString(),
                          ),
                        );
                        log(e.toString());
                      } finally {
                        EasyLoading.dismiss();
                      }
                    })
              ],
            ),
          )
        ]),
      ),
    );
  }

  connectAccountContract() async {
    var ethClient = Web3Client(apiUrl, httpClient);
    var credentials = await ethClient.credentialsFromPrivateKey(wallet.text);
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
          function: _contract.function("createAccount"),
          parameters: [],
        ),
        chainId: 53);
    log("got response");
    log(response1.toString());
  }
}
