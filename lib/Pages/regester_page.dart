import 'package:delivery/Extras/sign_in_button.dart';
import 'package:delivery/Extras/text_field.dart';
import 'package:delivery/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';

class Regester extends StatefulWidget {
  final VoidCallback onTap;
  const Regester({super.key, required this.onTap});

  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController RePasswordController = TextEditingController();

  // regester method
  void regester() async {
    // get auth service
    final _authService = AuthService();

    // check if password is match => create user
    if (PasswordController.text == RePasswordController.text) {
      // try creating user
      try {
        await _authService.signUpnWithEmailAndPassword(
          EmailController.text,
          PasswordController.text,
        );
      } catch (e) {
        // show error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      // show error message
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: const Text("Passwords don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                // bottom form
                Flexible(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up here!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          controller: EmailController,
                          obscureText: false,
                          hintText: "Email",
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: PasswordController,
                          obscureText: true,
                          hintText: "Password",
                          icon: Icons.lock,
                        ),
                        CustomTextField(
                          controller: RePasswordController,
                          obscureText: true,
                          hintText: " Confirm Password",
                          icon: Icons.lock,
                        ),
                        const SizedBox(height: 10),
                        MyButton(onTap: regester, text: "Sign Up"),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already a member ?",
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: Text(
                                "Login here !",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.inversePrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Milkshake
          Positioned(
            top: 20,
            right: -30,
            child: Image.asset(
              'lib/Images/SignUp/signup_milkshake.png',
              height: 190,
            ),
          ),

          // Double cheeseburger
          Positioned(
            top: 20,
            left: -20,
            child: Image.asset(
              'lib/Images/SignUp/signup_double_cheeseburger.png',
              height: 190,
            ),
          ),
          // Chocolate Cake
          Positioned(
            top: 80,
            right: 80,
            child: Image.asset(
              'lib/Images/SignUp/signup_chocolate_cake.png',
              height: 130,
            ),
          ),
          // Garden Salad
          Positioned(
            top: 80,
            left: 90,
            child: Image.asset(
              'lib/Images/SignUp/signup_garden_salad.png',
              height: 130,
            ),
          ),
        ],
      ),
    );
  }
}
