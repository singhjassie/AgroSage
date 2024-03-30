import 'package:agrosage/agrosage.dart';
import 'package:agrosage/screens/signup_screen.dart';
import 'package:agrosage/firebase/auth_provider.dart';
import 'package:agrosage/firebase/validation.dart';
import 'package:agrosage/widgets/input_box.dart';
import 'package:agrosage/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  bool rememberPassword = true;
  var appvalidator = AppValidator();

  late AuthProvider ap;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize ap variable here
    ap = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser(context) async {
    if (_key.currentState!.validate()) {
      var data = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      try {
        await ap.loginUser(data, context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AgroSage(),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Login failed"),
              content: Text(e.toString()),
            );
          },
        );
      }
    }
  }

// void loginUser() async {
//   if (_key.currentState!.validate()) {
//     // Perform login operation here
//     var data = {
//       "username": emailController.text,
//       "password": passwordController.text,
//     };

//     bool userExists = await ap.checkExistingUser(emailController.text);

//     if (userExists) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AgroSage(),
//         ),
//       );
//     } else {
//       // If the user does not exist, show a SnackBar prompting them to sign up
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('User does not exist. Please sign up.'),
//         ),
//       );
//     }
//   }
// }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            //upper clippath with less height
            clipper: WaveClipper(), //set our custom wave clipper.
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                "assets/images/Leaf_image.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Welcome  Back!",
                  style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(
                    color: colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          InputBox(
                            hintText: 'Email',
                            prefixIcon: Icons.person,
                            isPassword: false,
                            validator: appvalidator.validateEmail,
                            controller: emailController,
                          ),
                          const SizedBox(height: 20),
                          InputBox(
                            hintText: 'Password',
                            prefixIcon: Icons.password,
                            isPassword: true,
                            validator: appvalidator.validatePassword,
                            controller: passwordController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: rememberPassword,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            rememberPassword = value!;
                                          });
                                        }),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                          color: colorScheme.onBackground.withOpacity(.8), fontSize: 14,),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      child: Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: colorScheme.primary.withOpacity(.8),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: (){loginUser(context);},
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: colorScheme.onPrimary, fontSize: 16),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 8,),
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: colorScheme.onBackground.withOpacity(.8),
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(5)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUp(),
                                      ));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: colorScheme.primary,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}