import 'package:flutter/material.dart';
import 'package:ticket_reselling/export.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _mobileController = TextEditingController();
    return Material(
      child: Column(
        children: [
          Text(
            "Let's Get Started",
          ),
          Text("data"),
          CustomTextField(
              title: "Mobile Number",
              hintText: "hintText",
              controller: _mobileController,
              isRequired: true),
          gap12,
          ContainerButton(title: "Continue", onTap: () {}),
          gap8,
          ContainerButton(title: "Continue as Guest", onTap: () {}),
        ],
      ),
    );
  }

  void loginContinue() {}
}
