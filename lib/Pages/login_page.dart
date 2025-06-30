import 'package:delivery/Extras/sign_in_button.dart';
import 'package:delivery/Extras/text_field.dart';
import 'package:delivery/services/Auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  /// Called when the user taps “Sign up now!”
  final VoidCallback onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async {
    // get instance of auth service
    final _authService = AuthService();
    // try to sign in
    try {
      await _authService.singInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } 
    // display error
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //  Solid green background
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                ),

                //  Semi-transparent circle
                Opacity(
                  opacity: 0.2,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                //  Soda
                Positioned(
                  top: 70,
                  left: 10,
                  child: Image.asset(
                    'lib/Images/LogIn/login_soda.png',
                    width: 260,
                    // height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
                // Cheese-burger
                Positioned(
                  bottom: 91,
                  left: 140,
                  child: Image.asset(
                    'lib/Images/LogIn/login_cheeseburger.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                //  French-fries
                Positioned(
                  bottom: 80,
                  right: 50,
                  child: Image.asset(
                    'lib/Images/LogIn/login_french_fries.png',
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 1.0,
                vertical: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    CustomTextField(
                      controller: emailController,
                      obscureText: false,
                      hintText: "Email",
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 12),

                    CustomTextField(
                      controller: passwordController,
                      obscureText: true,
                      hintText: "Password",
                      icon: Icons.lock,
                    ),
                    const SizedBox(height: 24),

                    MyButton(onTap: login, text: "Sign in"),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Sign up now!",
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
