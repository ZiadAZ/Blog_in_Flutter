import 'package:ahmed_alsodani/authentication/authenticatable.dart';
import 'package:ahmed_alsodani/models/user/auther.dart';
import 'package:ahmed_alsodani/models/user/user.dart';
import 'package:ahmed_alsodani/scteens/sign_in.dart';
import 'package:ahmed_alsodani/share_ui/share_prefrence.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthenication implements Authenticatable {
  final _firebaseAuth = FirebaseAuth.instance;
  static final PROFILE = "profile";
  BuildContext context;
  static Auther a;

  @override
  Future<bool> resetPass(String email) {
    // TODO: implement resetPass
    return null;
  }

  FirebaseAuthenication(this.context);

  @override
  Future<bool> signIn(String email, String pass) {
    var v= _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((o) {
      Firestore.instance.collection("profile").where(
          "id_auth", isEqualTo: o.user.uid).snapshots().listen((user) {
        Auther auther = Auther.fromJSON(user.documents.first.data);
        SharePref.logIn(auther);
        Navigator.pop(context);
        print(auther.firstName + " " + auther.secondName);
      });
    }, onError: (jj) => print("wrong user"));
  }





  @override
  Future<bool> signOut(String email) {
    // TODO: implement signOu

    _firebaseAuth.signOut();
    SharePref.logOut();
    return null;
  }

  @override
  Future<bool> signUp(String email, String pass, String firstName,
      String secondName) async {
    bool b = false;
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      Firestore.instance.collection("profile").document().setData({
        "id_auth": user.user.uid,
        "user_id": 9,
        "firstName": firstName,
        "secondName": secondName,
        "email":user.user.email
      });
      Navigator.pushReplacement(context,MaterialPageRoute(builder:
          (context)=> SignIn() ));
      b = true;
    }, onError: (m) {
      print(m);
    });
    return b;
  }

  @override
  Future<User> updateProfile(User user) {
    // TODO: implement updateProfile
    return null;
  }
}
