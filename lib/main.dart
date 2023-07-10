import 'package:flutter/material.dart';
import 'package:flutter_diffrent_ui_part_3/modules/facebook_raction/fb_reaction_box.dart';
import 'package:flutter_diffrent_ui_part_3/modules/finger_print_auth/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  FbReactionBox(),
    );
  }
}
