import 'package:chatapp/features/view/pages/auth/signup_page.dart';
import 'package:flutter/material.dart';
import '../../../../../core/themes/styles.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  SignupPage(),
              ),
            );
          },
          child: Text(
            'Register here',
            style: Styles.textStyle10,
          ),
        ),
      ],
    );
  }
}