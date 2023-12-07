import 'package:advance_firebase/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController forgotController = TextEditingController();

  forgotPass(String email) async {
    if (email == null) {
      UiHelper.CustomAlertBox(context, 'Enter Email To Reset Password');
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
        UiHelper.CustomAlertBox(context, "We Send Link On Your Email");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Your Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Enter Your Email And Then Goto Gmail Official App \n And Then Open Link In The Latest Sms',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          UiHelper.CustomTextField(
              forgotController, "Enter Your Email", Icons.mail, false),
          const SizedBox(
            height: 30,
          ),
          UiHelper.CustomButton(() {
            forgotPass(forgotController.text.toString());
          }, "Forgot")
        ],
      ),
    );
  }
}
