import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  const Arrow({
    super.key, required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed:onPressed,
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}