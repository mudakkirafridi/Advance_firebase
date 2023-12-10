import 'dart:io';

import 'package:advance_firebase/screens/home_screen.dart';
import 'package:advance_firebase/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? myPickedPhoto;
  signUp(String email, String password) async {
    if (email == null && password == null) {
      UiHelper.CustomAlertBox(context, "Enter Email And Password");
    } else {
      UserCredential userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        uploadData();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  myDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick Image From Source'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    pickMyImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickMyImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.image,
                  ),
                  title: const Text('Gallery'),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Storage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                myDialog();
              },
              child: myPickedPhoto == null
                  ? CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                      radius: 80,
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(myPickedPhoto!),
                    )),
          const SizedBox(
            height: 8,
          ),
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          UiHelper.CustomTextField(
              passwordController, "Password", Icons.lock, true),
          const SizedBox(
            height: 30,
          ),
          UiHelper.CustomButton(() {
            signUp(emailController.text.toString(),
                passwordController.text.toString());
          }, 'Sign In')
        ],
      ),
    );
  }

  pickMyImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) {
        return;
      }
      final tempPhoto = File(photo.path);
      setState(() {
        myPickedPhoto = tempPhoto;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  uploadData() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("UsersImage")
        .child(emailController.text.toString())
        .putFile(myPickedPhoto!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection('Users')
        .doc(emailController.text.toString())
        .set({
      'Email': emailController.text.toString(),
      "Password": passwordController.text.toString(),
      'Image': url
    }).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
}
