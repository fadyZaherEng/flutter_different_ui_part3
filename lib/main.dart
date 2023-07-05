import 'package:flutter/material.dart';
import 'package:flutter_diffrent_ui_part_3/modules/alert_dialog/alert.dart';
import 'package:flutter_diffrent_ui_part_3/modules/open_external_app/external_app.dart';
import 'package:flutter_diffrent_ui_part_3/modules/sliverAppBar/sliver.dart';
import 'package:flutter_diffrent_ui_part_3/modules/stepper/stepper.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  const OpenExternalAppScreen(),
    );
  }
}
