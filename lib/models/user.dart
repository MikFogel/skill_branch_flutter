import 'package:FlutterGalleryApp/string_utils.dart';
import 'dart:core';

enum LoginType {
  email, phone
}


class User {
  String email;
  String phone;

  String _lastName;
  String _firstName;

  LoginType _type;

  List<User> friends = <User>[];

  User._({String firstName, String lastName, String email, String phone}) :
    _firstName = firstName,
    _lastName = lastName,
    this.phone = phone,
    this.email = email {
    print ("User is created");

    _type = email != null ? LoginType.email : LoginType.phone;

  }


  factory User({String name, String phone, String email}) {

    if (name.isEmpty) throw Exception("User name is empty");

    if (phone == null && email != null) {
      return User.fromEmail(name: name, email: email);
    } else if (email == null && phone == null) {
      return User.fromPhone(name:name, phone: phone);
    } else if (phone != null && email != null) {
      if (phone.isEmpty || email.isEmpty) throw Exception("Phone or email is empty");
    }

    return User._(
     firstName: _getFirstName(name),
     lastName: _getLastName(name),
     phone: checkPhone(phone),
      email: checkEmail(email)
    );
  }

  User.fromEmail({String name, String email}) {
    if (name.isEmpty) throw Exception("User name is empty");

    if (email.isEmpty) throw Exception("Email is empty");

    _firstName = _getFirstName(name);
    _lastName = _getLastName(name);
    this.email = checkEmail(email);

  }

  User.fromPhone({String name, String phone}) {
    if (name.isEmpty) throw Exception("User name is empty");

    if (phone.isEmpty) throw Exception("Email is empty");

    _firstName = _getFirstName(name);
    _lastName = _getLastName(name);
    this.phone = checkPhone(phone);

  }



  static String _getLastName(String userName) => userName.split(" ")[1];
  static String _getFirstName(String userName) => userName.split(" ")[0];

  static String checkPhone(String phone) {
    if (phone !=  null) {
      String pattern = r"^(?:[+0])?[0-9]{11}";

      phone = phone.replaceAll(RegExp("[^+\\d]"), "");

      if (phone == null || phone.isEmpty) {
        throw Exception("Enter don't empty phone number");
      } else if (!RegExp(pattern).hasMatch(phone)) {
        throw Exception("Enter a valid phone number starting with a + and containing 11 digits");
      }

      return phone;
    }

  }

  static String checkEmail(String email) {

    if (email != null) {

      String pattern = r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$";

      if (email == null || email.isEmpty) {
        throw Exception("Enter don't empty phone number");
      } else if (!RegExp(pattern).hasMatch(email)) {
        throw Exception("Enter a valid email address");
      }

      return email;
    }

  }

  String get login {
    if (_type == LoginType.phone) return phone;
    return email;
  }

  String get name => _firstName.capitalize() + " " + _lastName.capitalize();

  @override
  bool operator == (Object object) {
    if (object == null) return false;

    if (object is User) {
      return _firstName == object._firstName && _lastName == object._lastName &&
          (phone == object.phone || email == object.email);
    }
  }

  void addFriends(Iterable<User> newFriends) {
    friends.addAll(newFriends);
  }

  void removeFriends(User user){
    friends.remove(user);
  }

  String get userInfo => """
    name: $name
    email: $email
    firstName: $_firstName
    lastName: $_lastName
    friends: ${friends.toList()}
  """;

  @override
  String toString() {
    return """
    name: $name
    email: $email
    friends: ${friends.toList()}
  """;
  }
}