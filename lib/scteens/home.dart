import 'package:ahmed_alsodani/scteens/favorits.dart';
import 'package:ahmed_alsodani/scteens/whatsNew.dart';
import 'package:ahmed_alsodani/scteens/pupular.dart';
import 'package:ahmed_alsodani/share_ui/drawer.dart';
import 'package:ahmed_alsodani/api/blog.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    TabController _controller = TabController(length: 3, vsync: this);
    print("_homePageState build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Explorer"),
        actions: <Widget>[
          Icon(Icons.search),
          Icon(Icons.playlist_play),

        ],
        bottom: TabBar(
          indicatorColor: Colors.red.shade900,
          controller: _controller,
          tabs: <Widget>[
            Tab(text: "WHAT'S NEW"),
            Tab(text: "PUPULAR"),
            Tab(text: "FAVORITED"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          WhatNews(),
         Puplular(),
          Favorits()
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}


