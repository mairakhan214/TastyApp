import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodordering_app/provider/my_provider.dart';
import 'package:foodordering_app/screens/welcome_screen.dart';
import 'package:foodordering_app/screens/login_screen.dart';
import 'package:foodordering_app/screens/signup_screen.dart';
import 'package:foodordering_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screens/checkout.dart';
import 'screens/detail_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.deepOrange,
          ),
        ),
        home: WelcomePage(),      
      ),
    );
  }
}

