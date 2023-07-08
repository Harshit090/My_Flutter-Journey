// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatting_application/components/my_button.dart';
import 'package:chatting_application/components/my_text_field.dart';
import 'package:chatting_application/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in user
  void signIn() async {
    // get the autj service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
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
                    'Welcome back you\'ve been missed!',
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
                    height: 25,
                  ),

                  // sign in button
                  MyButton(onTap: signIn, text: 'Sign in'),

                  //spacing
                  SizedBox(
                    height: 50,
                  ),

                  // not a memeber? regester now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?'),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register now',
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
