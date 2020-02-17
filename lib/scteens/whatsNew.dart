import 'package:ahmed_alsodani/share_ui/share_prefrence.dart';
import 'package:ahmed_alsodani/share_ui/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ahmed_alsodani/models/blog/blog.dart';
import 'blogShow.dart';

class WhatNews extends StatefulWidget {
  @override
  _WhatNewsState createState() => _WhatNewsState();
}

class _WhatNewsState extends State<WhatNews> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _first(),
            _sectionTitle("  Top Stories"),
            Card(
              child: Column(
                children: <Widget>[
                  _second(),
                  _second(),
                  _second(),
                ],
              ),
            ),
            _sectionTitle("  Recent Update"),
            _third(),
            _third()
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 13),
      ),
    );
  }

  Widget _first() {
    var v=Blog(title: "g",content:"jjjjj",category: null,auther: SharePref.currentAuther,time: "30",image: "https://firebasestorage.googleapis.com/v0/b/my-flutter-firebase-41efc.appspot.com/o/zzz?alt=media&token=374a2e43-89d8-488f-801c-3dfb6077d02a");
    return GestureDetector(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => ShowBlog(v))),//lkklm;lm
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .25,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: ExactAssetImage("img/1.jpg"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Real Madrid is the Champion for the 14s in history" ,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "The Worg Global Warming Annual Summit The Worg Global Warming Annual Summit The Worg Global Warming Annual Summit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _second() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                width: 96,
                height: 96,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: ExactAssetImage(
                    "img/3.jpg",
                  ),
                  fit: BoxFit.fill,
                ))),
            Flexible(
              child: Container(
                height: 96,
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "The Worg Global Warming Annual Summit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Ziad Zayed",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                        ),
                        Time.showTime(" 15")

                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _secondListViwe() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "  Top Stories",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              Card(
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 124,
                        height: 124,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: ExactAssetImage(
                            "img/3.jpg",
                          ),
                          fit: BoxFit.fill,
                        ))),
                    Flexible(
                      child: Container(
                        height: 120,
                        margin: EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "The Worg Global Warming Annual Summit",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(

                              children: <Widget>[
                                Text(
                                  "Ziad Zayed",
                                  style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey),
                                ),
                               Time.showTime("15")
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
      itemCount: 3,
    );
  }

  Widget _third() {
    return Card(

      child: Column(
        children: <Widget>[
          Image.asset(
            "img/2.jpg",
            height: MediaQuery.of(context).size.height * .25,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 8,bottom: 4),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24,right: 24),
                    child: Text(
                      "SPORT",
                      style: TextStyle(
                          color: Colors.grey.shade200, fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: Colors.red,
                ),

                Text(   "Real Madrid is the Champion for the 14s in history",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
         Time.showTime("15"),

              ],
            ),
          )

        ],
      ),
    );
  }

}
