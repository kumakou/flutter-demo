import 'package:flutter/material.dart';
import '../models/user.dart';
import '../resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final Auth_Methods _authMethods = Auth_Methods();

  UserProvider() {
    setUser();
  }

  User? get getUser => _user;

  Future<void> setUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
