import 'package:advance_firebase/firebase_options.dart';
import 'package:advance_firebase/screens/cloud_firestore.dart';
import 'package:advance_firebase/screens/firebase_messaging.dart';
import 'package:advance_firebase/screens/forgot_screen.dart';
import 'package:advance_firebase/screens/home_screen.dart';
import 'package:advance_firebase/screens/show_data.dart';
import 'package:advance_firebase/screens/splash_Screen.dart';
import 'package:advance_firebase/screens/storage_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationServices.initializing();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.pink[200]),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CloudFirestoreScreen(),
    );
  }
}
