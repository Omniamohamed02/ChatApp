import 'package:flutter/material.dart';

import '../../../../../core/themes/colors.dart';

class Massagebutton extends StatelessWidget {
  const Massagebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {},
      backgroundColor: ColorApp.primaryColor,
      child: const Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
