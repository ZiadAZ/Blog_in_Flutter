import 'package:ahmed_alsodani/models/category/category.dart';
import 'package:ahmed_alsodani/models/comment/comment.dart';
import 'package:ahmed_alsodani/models/comment/comment_controller.dart';
import 'package:ahmed_alsodani/models/user/auther.dart';

class Blog{
  static final BLOG="Blog";
  int blogId;
  String title,content,time,image;
  Category category;
Auther auther;
List<Comment> comments;

  Blog({this.blogId, this.title, this.content, this.category, this.time, this.auther,this.comments,this.image});

  Blog.fromJSON(Map<String,dynamic> json){
    this.blogId=json['blog_id'];
    this.title=json['title'];
    this.content=json['content'];
    this.category=json['category'];
    this.time=json['time'];
    Map<String,dynamic> y=Map<String,dynamic>.from(json['auher']);

    this.auther=Auther.fromJSON(y);
    this.comments=CommentController.toComments(json['comments']);
    this.image=json['imageURL'];
  }
  Map<String, dynamic> toJson() =>
      {
        'blog_id': blogId,
        'title': title,
        'content': content,
        'category': category,
        'auher': auther.toJson(),
        'imageURL': image

      };


}