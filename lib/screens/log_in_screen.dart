import 'package:advance_firebase/screens/forgot_screen.dart';
import 'package:advance_firebase/screens/home_screen.dart';
import 'package:advance_firebase/screens/phone_otp.dart';
import 'package:advance_firebase/screens/sign_up_screen.dart';
import 'package:advance_firebase/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  logIn(String email, String password) async {
    if (email == '' && password == '') {
      UiHelper.CustomAlertBox(context, 'Enter Required Fields');
    } else {
      try {
        UserCredential? userCredential;
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      } on FirebaseAuthException catch (e) {
        UiHelper.CustomAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              emailController, 'Enter Email', Icons.mail, false),
          UiHelper.CustomTextField(
              passwordController, 'Enter Password', Icons.lock, true),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotScreen()));
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 15),
              )),
          UiHelper.CustomButton(() {
            logIn(emailController.text.toString(),
                passwordController.text.toString());
          }, 'Log In'),
          const SizedBox(
            height: 5,
          ),
          UiHelper.CustomButton(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PhoneOtpScreen()));
          }, 'Phone OTP'),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Create New Account?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text('Sign Up'))
            ],
          )
        ],
      ),
    );
    ;
  }
}
