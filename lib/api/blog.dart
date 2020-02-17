import 'dart:convert';

import 'package:ahmed_alsodani/models/blog/blog.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

class GetBlogs{
  List<Blog> _list=List<Blog>();
  String uri="http://ziadzayed.aba.vg/get_blogs.php";

  Future<List<Blog>> fecheBlogs() async{
    var response=await http.get(uri);
    if(response.statusCode==200){
      print("*************************************************");
var jsonData= jsonDecode(response.body);

for (var i in jsonData)
 // _list.add(Blog(int.parse(i['blog_id']),i['blog_title'],i['2'],i['3'],i["4"],i["5"],i["4"],i["5"]));
      print(jsonData);

    }
    return _list;
  }
}