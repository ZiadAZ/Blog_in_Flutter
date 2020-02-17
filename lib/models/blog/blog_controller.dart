import 'dart:io';

import 'package:ahmed_alsodani/scteens/blogShow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ahmed_alsodani/models/blog/blog.dart';
import 'package:flutter/cupertino.dart';

class BlogController {
  Blog blog;

  BlogController(this.blog);

  Future<String> uploadImage(File image) async {

    final StorageReference storageReference = FirebaseStorage().ref().child(
        "BlogImage/").child(new DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    String url=await snapshot.ref.getDownloadURL();
    return url;
  }

  void createNew(File image, ctx) async{
    print ("n");
    String imageURL=await uploadImage(image);
    blog.image=imageURL;
    print(imageURL);
    Firestore.instance.collection("Blog").document().setData(blog.toJson()).then((o)=>print("j"))
        .then((_){
      Navigator.pop(ctx);
    });
  }
}