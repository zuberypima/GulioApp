import 'package:flutter/material.dart';
import 'package:gulio/models/usermodel.dart';
import 'package:gulio/screens/makeoderscreen.dart';

class UserDetails extends ChangeNotifier {
  String? _userRole;

  String? get userRole => _userRole;

   void setUserRole(String value) {
     _userRole = value;
     print(_userRole);
     print('object new role');
     notifyListeners();
   }

}
