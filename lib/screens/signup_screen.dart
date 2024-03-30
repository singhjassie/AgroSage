import 'package:agrosage/agrosage.dart';
import 'package:agrosage/profile/profile.dart';
import 'package:agrosage/firebase/auth_provider.dart';
import 'package:agrosage/screens/login_screen.dart';
import 'package:agrosage/firebase/user_model.dart';
import 'package:agrosage/firebase/validation.dart';
import 'package:agrosage/widgets/input_box.dart';
import 'package:agrosage/widgets/label_divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var appvalidator = AppValidator();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    if (_key.currentState!.validate()) {
      // Create a new UserModel object with user input data
      UserModel userModel = UserModel(
        email: emailController.text.trim(),
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        phoneNumber: '', // You might want to set this if applicable
        uid: '', // This will be set automatically after saving to Firebase
      );

      // Call the saveUserDataToFirebase method to save the data
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          // Upon successful data saving, perform further actions
          ap.saveUserDataToSP().then((value) => ap.setSignIn().then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      name: usernameController.text.trim(), // Pass username
                      email: emailController.text.trim(), // Pass email
                    ),
                  ),
                  (route) => false,
                );
              }));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        body: SafeArea(
      child: isLoading == true
          ? Center(child: CircularProgressIndicator(color: colorScheme.primary))
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: Text(
                            "Register Account!",
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Create New Account",
                          style: TextStyle(
                            color: colorScheme.onBackground,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Form(
                              key: _key,
                              child: Column(
                                children: [
                                  InputBox(
                                    hintText: 'Email',
                                    prefixIcon: Icons.email,
                                    isPassword: false,
                                    validator: appvalidator.validateEmail,
                                    controller: emailController,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InputBox(
                                    hintText: 'Username',
                                    prefixIcon: Icons.person,
                                    isPassword: false,
                                    validator: appvalidator.validateUsername,
                                    controller: usernameController,
                                  ),
                                  const SizedBox(height: 20),
                                  InputBox(
                                    hintText: 'Password',
                                    prefixIcon: Icons.password,
                                    isPassword: true,
                                    validator: appvalidator.validatePassword,
                                    controller: passwordController,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          color: colorScheme.onBackground
                                              .withOpacity(.7),
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: colorScheme.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_key.currentState!.validate()) {
                                            Navigator.of(context).pop();
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AgroSage(),
                                              ),
                                            );
                                            // If form is valid, call storeData to save user data
                                            storeData();
                                          }
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: colorScheme.onPrimary,
                                              fontSize: 16),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  const LabelDivider(label: 'or Continue with'),
                                  const SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: Image.asset(
                                              'assets/images/google.png'),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.facebook,
                                            size: 36,
                                            color: Colors.blue[600],
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.phone,
                                            size: 32,
                                            color: Colors.teal,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                          color: colorScheme.onBackground
                                              .withOpacity(.7),
                                          fontSize: 18,
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
                                                builder: (context) =>
                                                    const Login(),
                                              ));
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: colorScheme.primary,
                                            fontSize: 18,
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
            ),
    ));
  }
}
