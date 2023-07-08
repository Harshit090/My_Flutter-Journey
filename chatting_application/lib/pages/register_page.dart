// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatting_application/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up  user
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password dose not match!"),
        ),
      );
      return;
    }

    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //spacing
                  SizedBox(
                    height: 50,
                  ),
                  // logo
                  Icon(
                    Icons.message,
                    size: 100,
                  ),

                  //spacing
                  SizedBox(
                    height: 50,
                  ),

                  // welcome back message
                  const Text(
                    "Let's create an account for you!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  //spacing
                  SizedBox(
                    height: 30,
                  ),

                  // email textfield
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false),

                  //spacing
                  SizedBox(
                    height: 10,
                  ),

                  // password tectfield
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true),

                  //spacing
                  SizedBox(
                    height: 10,
                  ),

                  // confrm password tectfield
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true),

                  //spacing
                  SizedBox(
                    height: 25,
                  ),

                  // sign up button
                  MyButton(onTap: signUp, text: 'Sign up'),

                  //spacing
                  SizedBox(
                    height: 50,
                  ),

                  // not a memeber? regester now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already a member?'),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login now',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
