import 'package:advance_firebase/screens/home_screen.dart';
import 'package:advance_firebase/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CloudFirestoreScreen extends StatefulWidget {
  const CloudFirestoreScreen({super.key});

  @override
  State<CloudFirestoreScreen> createState() => _CloudFirestoreScreenState();
}

class _CloudFirestoreScreenState extends State<CloudFirestoreScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  addData(String name, String email, String password) {
    if (name == "" && email == '' && password == "") {
      UiHelper.CustomAlertBox(context, "Enter Required Field");
    } else {
      FirebaseFirestore.instance.collection("Clients").doc(name).set(
          {"Name": name, "email": email, "password": password}).then((value) {
        UiHelper.CustomAlertBox(context, "Wait We Are Sending Your Data");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Practice"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(nameController, "Name", Icons.person, false),
          const SizedBox(
            height: 8,
          ),
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          const SizedBox(
            height: 8,
          ),
          UiHelper.CustomTextField(
              passwordController, "Password", Icons.lock, true),
          const SizedBox(
            height: 30,
          ),
          UiHelper.CustomButton(() {
            addData(
                nameController.text.toString(),
                emailController.text.toString(),
                passwordController.text.toString());
          }, "SignUp")
        ],
      ),
    );
  }
}
