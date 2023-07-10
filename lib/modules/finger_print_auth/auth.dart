// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class HomePageAuthCheck extends StatefulWidget {
  const HomePageAuthCheck({super.key});

  @override
  _HomePageAuthCheckState createState() => _HomePageAuthCheckState();
}

class _HomePageAuthCheckState extends State<HomePageAuthCheck> {
  //variable to check is biometric is there or not
  bool? _hasBiometricSenson;
  // list of finger print added in local device settings
  List<BiometricType>? _availableBiomatrics;
  String  _isAuthorized = "NOT AUTHORIZED";
  LocalAuthentication authentication = LocalAuthentication();

  //future function to check if biometric senson is available on device
  Future<void> _checkForBiometric() async{
    bool? hasBiometric;
    try{
      hasBiometric = await authentication.canCheckBiometrics;
    } on PlatformException catch(e)
    {
      print(e);
    }
    if(!mounted) return;
    setState(() {
      _hasBiometricSenson = hasBiometric;
    });
  }

  //future function to get the list of Biometric or faceID added into device
  Future<void> _getListofBiometric() async{
    List<BiometricType>? ListofBiometric;

    try{
      ListofBiometric = await authentication.getAvailableBiometrics();
    } on PlatformException catch(e)
    {
      print(e);
    }

    if(!mounted) return;

    setState(() {
      _availableBiomatrics  = ListofBiometric;
    });
  }

  ////future function to check is the use is authorized or no
  Future<void> _getAuthentication() async{
    bool isAutherized = false;

    try{

      isAutherized = await authentication.authenticate(
          localizedReason: "SCAN YOUR FINGER PRINT TO GET AUTHORIZED",
      );
    } on PlatformException catch(e)
    {
      print(e);
    }

    if(!mounted) return;

    setState(() {
      _isAuthorized = isAutherized ? "AUTHORIZED" : "NOT AUTHORIZED";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter local Auth Package"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(" Is BioMetric Available ? : $_hasBiometricSenson"),
            TextButton(onPressed: (){
              _checkForBiometric();
            },child: const Text("Check",style: TextStyle(color: Colors.white),),),


            Text(" List of Available Biomatric LIST : $_availableBiomatrics"),
            TextButton(onPressed: (){
              _getListofBiometric();
            },child: const Text("Check List",style: TextStyle(color: Colors.white),),),


            Text(" Is AUTHORIED ? : $_isAuthorized"),
            TextButton(onPressed: (){
              _getAuthentication();
            },child: const Text("AUTH",style: TextStyle(color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}