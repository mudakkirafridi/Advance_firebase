import 'package:advance_firebase/screens/home_screen.dart';
import 'package:advance_firebase/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  String verify;
  OtpScreen({super.key, required this.verify});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your Code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(otpController, "123456", Icons.lock, false),
          UiHelper.CustomButton(() async {
            try {
              PhoneAuthCredential credential =
                  await PhoneAuthProvider.credential(
                      verificationId: widget.verify,
                      smsCode: otpController.text.toString());
              FirebaseAuth.instance
                  .signInWithCredential(credential)
                  .then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              });
            } catch (e) {
              UiHelper.CustomAlertBox(context, e.toString());
            }
          }, "Done")
        ],
      ),
    );
  }
}
