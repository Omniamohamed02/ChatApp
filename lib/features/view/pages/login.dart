import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  void login(BuildContext context) {

    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(color: Colors.teal,));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('login'),
      ),
    );}}