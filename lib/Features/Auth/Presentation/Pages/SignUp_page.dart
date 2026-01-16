import 'package:blogapp/Features/Auth/Presentation/Pages/Login_page.dart';
import 'package:blogapp/Features/Auth/Presentation/Widgets/auth_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Theme/AppPallet.dart';
import '../Widgets/gradient_button.dart';
import '../bloc/auth_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign up.",
                    style: TextStyle(
                      color: AppPallet.whiteColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  AuthField(
                    hintText: "Username",
                    controller: usernameController,
                  ),
                  const SizedBox(height: 20),
                  AuthField(hintText: "Email", controller: emailController),
                  const SizedBox(height: 20),
                  AuthField(
                    hintText: "Password",
                    controller: passwordController,
                    isObscure: true,
                  ),
                  const SizedBox(height: 30),
                  GradientButton(
                    buttonText: "Sign Up",
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          AuthSignup(
                            email: emailController.text,
                            password: passwordController.text,
                            username: usernameController.text,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, LoginPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: " Sign In",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppPallet.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
