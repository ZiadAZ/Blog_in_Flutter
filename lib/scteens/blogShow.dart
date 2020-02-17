import 'dart:io';

import 'package:ahmed_alsodani/models/blog/blog.dart';
import 'package:ahmed_alsodani/models/blog/blog_controller.dart';
import 'package:ahmed_alsodani/models/user/auther.dart';
import 'package:ahmed_alsodani/share_ui/share_prefrence.dart';
import 'package:ahmed_alsodani/share_ui/time.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowBlog extends StatefulWidget {
  final Blog _blog;

  ShowBlog(this._blog);

  @override
  _ShowBlogState createState() => _ShowBlogState();
}

class _ShowBlogState extends State<ShowBlog> {

  Auther auther;

Blog _blog;

  @override
  void initState() {
   _blog=widget._blog;
   auther=_blog.auther;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("jj");

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(child: Text(widget._blog.title, style: TextStyle(
                  color: Colors.white,)),
                    )],
                ),
              ),
              background: Container(

                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(_blog.image),
                  fit: BoxFit.fill,
                )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, how) {
              return Column(
                children: <Widget>[

                  Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            auther.firstName + " " + auther.secondName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          Time.showTime(_blog.time)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0), child: Text(
    widget._blog.content,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    ),
    )),
                  ),


                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }









}
