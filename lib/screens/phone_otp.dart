import 'package:advance_firebase/screens/otp_screen.dart';
import 'package:advance_firebase/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PhoneOtpScreen extends StatefulWidget {
  const PhoneOtpScreen({super.key});

  @override
  State<PhoneOtpScreen> createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone OTP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              phoneController, "+923078555817", Icons.phone, false),
          UiHelper.CustomButton(() async {
            await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credentials) {},
                verificationFailed: (FirebaseAuthException e) {},
                codeSent: (String verificationId, int? token) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpScreen(
                                verify: verificationId,
                              )));
                },
                codeAutoRetrievalTimeout: (String verificationid) {},
                phoneNumber: phoneController.text.toString());
          }, "Sent OTP")
        ],
      ),
    );
  }
}
