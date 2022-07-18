import 'package:flutter/material.dart';

class LoginFirstTimeFormScreen extends StatefulWidget {
  const LoginFirstTimeFormScreen({Key? key}) : super(key: key);

  @override
  State<LoginFirstTimeFormScreen> createState() =>
      _LoginFirstTimeFormScreenState();
}

class _LoginFirstTimeFormScreenState extends State<LoginFirstTimeFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'Form Filling page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
