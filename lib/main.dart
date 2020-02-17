import 'dart:html';

import 'package:ahmed_alsodani/models/user/auther.dart';
import 'package:ahmed_alsodani/scteens/home.dart';
import 'package:ahmed_alsodani/scteens/onbording.dart';
import 'package:ahmed_alsodani/scteens/signUp.dart';
import 'package:ahmed_alsodani/share_ui/share_prefrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


ThemeData mainTheme = ThemeData(
  primaryColor: Colors.red,
  backgroundColor: Colors.amber,
  accentColor: Colors.green,

);

main() async {
  // a2d0e996236c49218523fa85c62477c3
  WidgetsFlutterBinding.ensureInitialized();
  Widget screen;
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool seen = pref.getBool('SEEN');





if
(
seen == null
||
seen == false
)
screen =

OnBording();else {
SharePref.getAuther();
screen = homePage();
}
runApp
(
MaterialApp
(
debugShowCheckedModeBanner: false
,
home: screen,theme: mainTheme,)
);

}
