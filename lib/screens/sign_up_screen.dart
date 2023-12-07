import 'package:advance_firebase/screens/forgot_screen.dart';
import 'package:advance_firebase/screens/home_screen.dart';
import 'package:advance_firebase/screens/log_in_screen.dart';
import 'package:advance_firebase/screens/phone_otp.dart';
import 'package:advance_firebase/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  signUp(String email, String password) async {
    if (email == '' && password == '') {
      UiHelper.CustomAlertBox(context, 'Enter Required Fields');
    } else {
      try {
        UserCredential? userCredential;
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
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
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              emailController, 'Enter Email', Icons.mail, false),
          UiHelper.CustomTextField(
              passwordController, 'Enter Password', Icons.lock, true),
          UiHelper.CustomTextField(
              nameController, "Enter Your Name", Icons.person, false),
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
            signUp(emailController.text.toString(),
                passwordController.text.toString());
          }, 'Sign UP'),
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
              const Text('Already Have An Account?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                  },
                  child: const Text('LogIn'))
            ],
          )
        ],
      ),
    );
  }
}
