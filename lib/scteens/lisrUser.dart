import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users list"),actions: <Widget>[
        IconButton(icon: Icon(Icons.delete), onPressed: ()=>Firestore.instance.collection("profile").getDocuments().then((snapshot) {
          for (DocumentSnapshot ds in snapshot.documents)
            ds.reference.delete();

        }))
      ],),
      body: StreamBuilder(
        stream: Firestore.instance.collection("profile").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> s){
    if(s.hasError)return Text("erorr");
    else
    switch(s.connectionState){
    case ConnectionState.waiting: return CircularProgressIndicator();

    default: return ListView(
    children: s.data.documents.map((DocumentSnapshot d){
    return ListTile(
    title: Text(d["first_name"]),
    );
    }).toList());
    }




        },
      ),
    );
  }
}
