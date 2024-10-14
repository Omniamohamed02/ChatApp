
import 'package:chatapp/features/view/pages/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    return Scaffold(
      body:   Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/core/constant/assets/images/logo.png',height: 200,width: 200,),
              const SizedBox(height: 30),
              const Text(
                "what's App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text(
                'The best chat app of this contury',
                style: TextStyle(fontSize: 16),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
