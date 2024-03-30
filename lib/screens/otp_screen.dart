import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;

  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String smsCode = '';

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.secondary,
                    ),
                    child: Image.asset("Assets/VERIFY-removebg-preview.png"),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Enter a Verification code ",
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter the OTP sent to your phone number ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 107, 106, 106),
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colorScheme.primary),
                      ),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    onCompleted: (value) {
                      setState(() {
                        smsCode = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 285,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () async {
                        await verifyOtpAndNavigate(context);
                      },
                      child: const Text("Verify", style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Didn't receive any code ?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 107, 106, 106),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Resend new code ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                      fontSize: 16,
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

  Future<void> verifyOtpAndNavigate(BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );
      // Sign in with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Navigate to the next screen
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ProfileScreen()),
      // );
    } catch (ex) {
      // Handle verification failure
      print("Error verifying OTP: $ex");
      // Display an error message to the user
      // For example, show a snackbar or a dialog
    }
  }
}
