import 'package:flutter/material.dart';
import 'package:travel_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user = null;

  User? get user => _user;

  void setUser(User authenticatedUser) => _user = authenticatedUser;

}