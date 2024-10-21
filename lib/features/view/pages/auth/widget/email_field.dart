
import 'package:flutter/material.dart';
import '../../../../../core/shared-widget/dafault_text.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({required this.emailController, super.key});

  @override
  Widget build(BuildContext context) {
    return defaultText(
      type: TextInputType.emailAddress,
      controller: emailController,
      label: 'enter your email',
      hint: 'your email',
      prefix: Icons.email,
      validate: (value) {
        if (value!.isEmpty) {
          return 'Email must not be empty';
        }
        return null;
      },
    );
  }
}