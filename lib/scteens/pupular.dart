import 'package:ahmed_alsodani/api/blog.dart';
import 'package:ahmed_alsodani/models/blog/blog.dart';
import 'package:ahmed_alsodani/scteens/blogShow.dart';
import 'package:ahmed_alsodani/share_ui/time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Puplular extends StatefulWidget {
  @override
  _PuplularState createState() => _PuplularState();
}

class _PuplularState extends State<Puplular> {
  @override
  Widget build(BuildContext context) {
    List<Blog> blogs = List<Blog>();
    return StreamBuilder(
      stream: Firestore.instance.collection("Blog").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot>snapShot) {
        print(snapShot.data);
        if (snapShot.hasError)
          return Text("Erorr");
       else if (snapShot.connectionState == ConnectionState.waiting)
        return  CircularProgressIndicator();
          else{
            blogs = snapShot.data.documents.map(( d){
              return Blog.fromJSON(d.data);
            }).toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ShowBlog(blogs[index]))),
                  child: Card(
                    child: _second(blogs[index]),
                  ),
                );
              },
              itemCount: blogs.length,
            );
          }

       }


    );
  }

  Widget _second(Blog blog) {
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
                      image: NetworkImage(
                       blog.image,scale: 9.0
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
                      blog.title,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          blog.auther.firstName +" "+blog.auther.secondName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                        Time.showTime(" ${blog.time}")
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


}
