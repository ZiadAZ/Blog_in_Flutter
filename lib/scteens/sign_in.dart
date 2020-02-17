import 'package:ahmed_alsodani/authentication/firebase.dart';
import 'package:ahmed_alsodani/scteens/signUp.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email,_pass;
  final _formKey=GlobalKey<FormState>();
  FirebaseAuthenication auth;
  @override
  void initState() {
    auth=FirebaseAuthenication(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Form(

              key:_formKey ,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(onSaved: (v)=>_email=v,validator: (v)=>v.toString().isEmpty?"riquid":null,),
                    TextFormField(onSaved: (v)=>_pass=v,validator: (v)=>v.toString().isEmpty?"riquid":null,),
                    Card(
                        margin: EdgeInsets.only(top: 32),
                        color: Colors.red.shade900,
                        child: FlatButton(
                          child: Text(
                            "SIGN IN ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          onPressed: () async {
    if(_formKey.currentState.validate()){
    _formKey.currentState.save();
    auth.signIn(_email, _pass);
    Navigator.pop(context);


    }
                          },
                        )),
                    Card(
                        margin: EdgeInsets.only(top: 8),
                        color: Colors.red.shade900,
                        child: FlatButton(
                          child: Text(
                            "or SIGN UP ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:
                                (context)=> SignUp() ));
                          }
                          ,
                        )),
   ] ),
              )))),
      ));

  }
  }

