import 'package:chatapp/features/view/pages/auth/widget/email_field.dart';
import 'package:chatapp/features/view/pages/auth/widget/login_button.dart';
import 'package:chatapp/features/view/pages/auth/widget/logo.dart';
import 'package:chatapp/features/view/pages/auth/widget/password_field.dart';
import 'package:chatapp/features/view/pages/auth/widget/register_row.dart';
import 'package:chatapp/features/view/pages/home/chats_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chatapp/features/view/pages/auth/widget/title_widget.dart';

import '../home/widget/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isPasswordVisible = false;
var formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Logo(),
              const SizedBox(height: 20),
              TitleWidget(),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    EmailField(emailController: emailController),
                    const SizedBox(height: 15),
                    PasswordField(
                      passwordController: passwordController,
                      isPasswordVisible: isPasswordVisible,
                      toggleVisibility: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    LoginButton(
                      emailController: emailController,
                      passwordController: passwordController,
                      onSuccess: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavBar(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const RegisterRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}
