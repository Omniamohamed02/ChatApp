import 'package:flutter/material.dart';
import '../../../../../core/themes/styles.dart';
class TitleWidget extends StatelessWidget {
    const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Log in to your account',
      style: Styles.textStyle24,
      textAlign: TextAlign.center,
    );
  }
}
