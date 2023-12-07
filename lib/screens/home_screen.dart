import 'package:advance_firebase/screens/sign_up_screen.dart';
import 'package:advance_firebase/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UiHelper.CustomButton(() {
            logout();
          }, "Logout")
        ],
      ),
    );
  }
}
