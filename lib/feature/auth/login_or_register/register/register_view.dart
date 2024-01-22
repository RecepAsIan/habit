import 'package:flutter/material.dart';
import 'package:habits_second/feature/auth/login_or_register/register/mixin_register.dart';
import 'package:habits_second/product/constants/image_constants.dart';
import 'package:habits_second/product/constants/string_constants.dart';
import 'package:habits_second/product/widget/my_button.dart';

import '../../../../product/widget/my_text_field.dart';

class RegisterView extends StatefulWidget {
  final void Function()? onPressed;
  const RegisterView({super.key, required this.onPressed});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                //login image
                Image.asset(
                  ImageConstants.login,
                  width: 200,
                ),
                // email
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: MyTextField(
                      controller: emailController,
                      text: StringConstants.email,
                      obscureText: false),
                ),
                const SizedBox(height: 10),
                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                      controller: passwordController,
                      text: StringConstants.password,
                      obscureText: true),
                ),
                const SizedBox(height: 10),
                //confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                      controller: confirmPasswordController,
                      text: StringConstants.confirmPassword,
                      obscureText: true),
                ),

                const SizedBox(height: 20),
                //login button
                MyButton(
                  onTap: signUp,
                  text: StringConstants.register,
                ),
                const SizedBox(height: 10),
                //register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConstants.registerText,
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: widget.onPressed,
                        child: const Text(
                          StringConstants.registerTextLogin,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
