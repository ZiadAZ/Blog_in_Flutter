import 'package:ahmed_alsodani/authentication/firebase.dart';
import 'package:ahmed_alsodani/models/navMenu.dart';
import 'package:ahmed_alsodani/models/user/auther.dart';
import 'package:ahmed_alsodani/scteens/blogShow.dart';
import 'package:ahmed_alsodani/scteens/lisrUser.dart';
import 'package:ahmed_alsodani/scteens/mange_blog.dart';
import 'package:ahmed_alsodani/scteens/onbording.dart';
import 'package:ahmed_alsodani/scteens/sign_in.dart';
import 'package:ahmed_alsodani/share_ui/scama.dart';
import 'package:ahmed_alsodani/share_ui/share_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<NavItem> _listItem;

  @override
  void initState() {
    _listItem = fillList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_listItem[index].name),
            trailing: Icon(_listItem[index].iconData),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _listItem[index].destnation()));
            },
          );
        },
        itemCount: _listItem.length,
      ),
    );
  }

  List<NavItem> fillList() {
    Auther currentAuther = SharePref.currentAuther;
    List<NavItem> _listItem = [];
    if (currentAuther != null) {
      _listItem.add(NavItem("List User", () => UserList(), Icons.home));
      _listItem
          .add(NavItem("Add New Blog", () => MangeBlog(null), Icons.add_box));
      _listItem.add(NavItem("Sign out", () {
     FirebaseAuthenication(context).signOut(currentAuther.email);
        return SignIn();
      },Icons.account_box));
    } else {
      _listItem.add(NavItem("List User", () => UserList(), Icons.home));
      _listItem
          .add(NavItem("SignIn/SignUp", () => SignIn(), Icons.account_box));
    }
    return _listItem;
  }
}
