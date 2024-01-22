import 'package:flutter/material.dart';
import 'package:habits_second/feature/auth/login_or_register/login/mixin_login.dart';
import 'package:habits_second/product/constants/image_constants.dart';
import 'package:habits_second/product/constants/string_constants.dart';
import 'package:habits_second/product/enums/image_size.dart';
import '../../../../product/widget/my_button.dart';
import '../../../../product/widget/my_text_field.dart';

class LoginView extends StatefulWidget {
  final void Function()? onPressed;
  const LoginView({super.key, required this.onPressed});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                //login image
                Image.asset(
                  ImageConstants.login,
                  width: ImageSize.loginImage.value.toDouble(),
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
                const SizedBox(height: 20),
                //login button
                MyButton(
                  onTap: signIn,
                  text: StringConstants.registerTextLogin,
                ),
                const SizedBox(height: 10),
                //register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConstants.loginText,
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: widget.onPressed,
                      child: const Text(
                        StringConstants.register,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
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
