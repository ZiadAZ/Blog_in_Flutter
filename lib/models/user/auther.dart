import 'package:ahmed_alsodani/models/user/user.dart';

class Auther extends User {
static final PROFILE='profile';
  Auther(String id, String firstName, String secondName, String email)
      : super(id, firstName, secondName, email);

  Auther.fromJSON(Map<String, dynamic> json)  :
        super(json['id'], json['firstName'],json['secondName'],json['email']) {}

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'firstName': firstName,
        'secondName': secondName,
        'email': email,

      };

}
