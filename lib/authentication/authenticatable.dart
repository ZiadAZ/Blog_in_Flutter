import 'package:ahmed_alsodani/models/user/user.dart';

class Authenticatable{
 Future<bool> signUp(String email,String pass,String firstName, String secondName){}
  Future<bool> signIn(String email,String pass){}
  Future<bool> resetPass(String email){}
  Future<bool> signOut(String email){}
 Future<User> updateProfile(User user){}

}