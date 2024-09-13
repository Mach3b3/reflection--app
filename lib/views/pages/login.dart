// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:term_1_reflection/models/models.dart';
import 'package:term_1_reflection/routes/routes.dart';
import 'package:term_1_reflection/widgets/buttons.dart';
import 'package:term_1_reflection/widgets/socials.dart';
import 'package:term_1_reflection/widgets/text_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // Initially obscure password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: AccountInfo(
          text1: "Don’t have an account?",
          text2: "Register Now",
          onTap: () {},
        ),
      ),
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text('Reflective App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Welcome !\nto TPG316C 2024!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              TextInput(
                hintText: "Enter your email",
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextInput(
                hintText: "Enter your password",
                obscureText: _obscurePassword, // Toggle visibility
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8 || !value.contains('@')) {
                    return 'Password must be at least 8 characters long and contain "@"';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // Toggle visibility
                    });
                  },
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.topRight,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              MyButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final emailProvider =
                        Provider.of<EmailProvider>(context, listen: false);
                    emailProvider.setEmail(_emailController.text);
                    Navigator.pushNamed(context, RouteManager.mainPage);
                  }
                },
                text: 'Login',
              ),
              const SizedBox(height: 15),
              const SocialButton(orText: "Or Login with"),
            ],
          ),
        ),
      ),
    );
  }
}
