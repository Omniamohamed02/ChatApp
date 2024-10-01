import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/images/logo.jpg'),
            Text(
              "what's App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'The best chat app of this contury',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {},
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
