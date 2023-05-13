import 'package:flutter/material.dart';

class UserDetails extends ChangeNotifier {
  // final String _id;
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phoneNumber = '';
  String _userRole = '';
  String _userLocation = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get userRole => _userRole;
  String get userLocation => _userLocation;

  void setfirstName(String fname) {
    _firstName = fname;
    notifyListeners();
  }

   void setLname(String  lname,) {
    _lastName=lname;
    notifyListeners();
  }

   void setEmail(String mailAdress,) {
    _email=mailAdress;
    notifyListeners();
  }
   void setPhone(String phone,) {
    _phoneNumber =phone;
    notifyListeners();
  }

   void setLocation(String location) {
    _userLocation =location;
    notifyListeners();
  }
   void setUserRole(String role) {
    _userRole =role;
    notifyListeners();
  }
}
