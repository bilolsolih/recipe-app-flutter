import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      String login = loginController.text;
      String password = passwordController.text;


      if (login == 'test@example.com' && password == '123456') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }
}
