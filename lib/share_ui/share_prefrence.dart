import 'package:ahmed_alsodani/models/user/auther.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref{
  static Auther currentAuther;
 static void getAuther() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Auther auther;
    String s=pref.getString("email");
    print(s);
    if( pref.getString("email")!= null)
     auther= Auther(
        pref.getString("user_id"),
        pref.getString("first_name"),
        pref.getString("secondName"),
        pref.getString("email")
    );
currentAuther= await auther;
  }
 static logIn(Auther auther) async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("user_id", auther.id);
    pref.setString("first_name", auther.firstName);
    pref.setString("secondName", auther.secondName);
    pref.setString("email", auther.email);
    currentAuther=auther;
  }

  static void logOut() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("user_id", null);
    pref.setString("first_name", null);
    pref.setString("secondName", null);
    pref.setString("email", null);
    currentAuther=null;
  }
}