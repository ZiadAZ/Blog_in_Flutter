import 'package:ahmed_alsodani/authentication/firebase.dart';
import 'package:ahmed_alsodani/scteens/sign_in.dart';
import 'package:ahmed_alsodani/share_ui/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _pass,_firstName,_secondName;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuthenication auth;
@override
  void initState() {
auth=FirebaseAuthenication(context);
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 64),
            child: Form(
              key: _formKey,
              child: Column(

                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: "First Name"),
                    onSaved: (v) => _firstName = v,
                    validator: (v) => v.toString().isEmpty ? "riquid" : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Second Name"),
                    onSaved: (v) => _secondName = v,
                    validator: (v) => v.toString().isEmpty ? "riquid" : null,
                  ),
                  TextFormField(
                    onSaved: (v) => _email = v,
                    validator: (v) => v.toString().isEmpty ? "riquid" : null,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  TextFormField(
                    onSaved: (v) => _pass = v,
                    validator: (v) => v.toString().isEmpty ? "riquid" : null,
                    decoration: InputDecoration(hintText: "Password"),
                  ),



             Card(
               margin: EdgeInsets.only(top: 32),
              color: Colors.red.shade900,
              child: FlatButton(
                child: Text(
                  "SIGN UP ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                       bool b=await auth.signUp(_email, _pass,_firstName,_secondName);
                       print(b);
                      }
                    },
                  )),
                  Card(
                      margin: EdgeInsets.only(top: 8),
                      color: Colors.red.shade900,
                      child: FlatButton(
                        child: Text(
                          "or SIGN IN ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder:
    (context)=> SignIn() ));
                          }
                        ,
                      )),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
