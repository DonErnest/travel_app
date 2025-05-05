import 'package:flutter/material.dart';
import 'package:travel_app/models/user.dart';



class LoginFormController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  UserCredentials getSuggestedUserCredentials() {
    return UserCredentials(
      username: usernameController.text,
      password: passwordController.text,
    );
  }
}
