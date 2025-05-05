import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/app_routes.dart';
import 'package:travel_app/providers/user_provider.dart';
import 'package:travel_app/services/user.dart';
import 'package:travel_app/widgets/canvas.dart';
import 'package:travel_app/widgets/login_form/user_controller.dart';
import 'package:travel_app/widgets/login_form/user_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormController = LoginFormController();
  bool errorRaised = false;
  String? error;
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProvider = context.watch<UserProvider>();
  }

  @override
  void dispose() {
    super.dispose();
    loginFormController.dispose();
  }

  void authenticate() {
    if (loginFormController.formKey.currentState!.validate()) {
      final (user, success) = getUser(
          loginFormController.getSuggestedUserCredentials()
      );
      setState(() {
        if (!success) {
          error = "Either credentials are invalid, or user is not available";
          errorRaised = success;
        } else {
          userProvider.setUser(user!);
          Navigator.of(context).pushReplacementNamed(AppRoutes.journeys);
        };
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        LoginForm(controller: loginFormController),
        if (errorRaised) Text(error!),
        TextButton(onPressed: authenticate, child: Text("Login")),
      ],
    );
  }
}
