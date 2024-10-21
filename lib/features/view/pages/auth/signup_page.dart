import 'package:chatapp/features/view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constant/asset_images.dart';
import '../../../../core/shared-widget/custom_button.dart';
import '../../../../core/shared-widget/dafault_text.dart';
import '../../../../core/themes/styles.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isPasswordVisible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AssetImages.logo,
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                  'Register To New Account',
                  style: Styles.textStyle24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                defaultText(
                  type: TextInputType.text,
                  controller: nameController,
                  label: 'Enter your name',
                  hint: 'Your name',
                  prefix: Icons.person,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Name must not be empty';
                    }
                    return null;
                  },
                  onChange: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 15.0),
                defaultText(
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'Enter your email',
                  hint: 'Your email',
                  prefix: Icons.email,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                  onChange: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 15.0),
                defaultText(
                  type: TextInputType.phone,
                  controller: phoneController,
                  label: 'Enter your phone',
                  hint: 'Your phone',
                  prefix: Icons.phone_android_rounded,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Phone must not be empty';
                    }
                    return null;
                  },
                  onChange: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 15.0),
                defaultText(
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                  hint: 'Password',
                  label: 'Enter your password',
                  prefix: Icons.lock,
                  suffix: isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  pressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  validate: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  onChange: (value) {
                    print(value);
                  },
                  isObscure: !isPasswordVisible,
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: 'Sign Up',
                  func: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else {
                      displayToastMssg('Please correct the errors', context);
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text('Login here'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}
