import 'package:flutter/cupertino.dart';

class NavItem{
  String _name;
  Function _destnation;
IconData _iconData;

  NavItem(this._name, this._destnation,this._iconData);

  String get name => _name;

  Function get destnation => _destnation;

  IconData get iconData => _iconData;


}