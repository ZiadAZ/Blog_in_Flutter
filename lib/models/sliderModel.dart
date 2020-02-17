import 'package:flutter/cupertino.dart';

class Sliders{
  IconData _icon;
  String _title;
  String _descripton;
  String _imgPath;

  Sliders(this._icon, this._title, this._descripton,this._imgPath);

  String get imgPath => _imgPath;

  String get descripton => _descripton;

  String get title => _title;

  IconData get icon => _icon;




}