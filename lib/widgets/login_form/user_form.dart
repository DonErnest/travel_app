import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/user_provider.dart';
import 'package:travel_app/widgets/login_form/user_controller.dart';

class LoginForm extends StatefulWidget {
  final LoginFormController controller;

  const LoginForm({super.key, required this.controller});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProvider = context.watch<UserProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("Enter username")),
              controller: widget.controller.usernameController,
              maxLines: 1,
              validator: (value) {
                if (value == null) {
                  return "please, enter username";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Enter password")),
              controller: widget.controller.passwordController,
              maxLines: 1,
              validator: (value) {
                if (value == null) {
                  return "please, enter password";
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
