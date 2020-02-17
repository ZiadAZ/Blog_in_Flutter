import 'dart:io';

import 'package:ahmed_alsodani/models/blog/blog.dart';
import 'package:ahmed_alsodani/models/blog/blog_controller.dart';
import 'package:ahmed_alsodani/models/user/auther.dart';
import 'package:ahmed_alsodani/share_ui/share_prefrence.dart';
import 'package:ahmed_alsodani/share_ui/time.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MangeBlog extends StatefulWidget {
  final Blog _blog;

  MangeBlog(this._blog);

  @override
  _MangeBlogState createState() => _MangeBlogState();
}

class _MangeBlogState extends State<MangeBlog> {
  String state;
  static const ADD = "ADD";
  static const EDIT = "EDIT";
  Auther auther;
  String _time;
  File _image;
  Blog _blog;
  BlogController _blogController;

  final titleText = TextEditingController();
  final contentText = TextEditingController();

  String erorr="";


  @override
  void dispose() {
    titleText.dispose();
    contentText.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    if (widget._blog != null) {
      state = EDIT;
      _blog = widget._blog;
      _blogController = BlogController(_blog);
      auther = _blog.auther;
      _time = _blog.time;
    } else {
      state = ADD;
      auther = SharePref.currentAuther;
      _time = "Now";
    }
    print(state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build mange bloge");

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
                    Flexible(
                        child: TextField(
                     controller: titleText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          hintText: "Write Title Here",
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Colors.grey.shade300)),
                    )),
                  ],
                ),
              ),
              background: Container(
                child: GestureDetector(
                  onTap: () => _getImage(),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Add Photo",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: (_image != null
                      ? FileImage(_image)
                      : ExactAssetImage("img/1.jpg")),
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
                          Text(auther.firstName+ " "+auther.secondName,

                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          Time.showTime(_time)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0), child: TextField(controller: contentText, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ))),
                  ),
                  _saveBlog()
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }





  Future _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget _saveBlog() {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Column(
            children: <Widget>[
              Text(erorr),
              Icon(
                Icons.save,
                color: Colors.white,
              ),
              Text(
                "SAVE BLOG",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          onPressed: () {
            if (titleText.text == null || contentText.text == null || _image == null)
              setState(() {
                erorr = "You must fill";
              });
            else {
              Blog newBlog = Blog(
                  time: Time().toString(),
                  auther: auther,
                  content: contentText.text,
                  title: titleText.text);
              _blogController = BlogController(newBlog);
              _blogController.createNew(_image,context);
            }
          },
          color: Colors.green,
        ),
      ],
    );
  }
}
