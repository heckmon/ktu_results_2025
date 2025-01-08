import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ktu_results/app_bar.dart';
import 'package:ktu_results/desktop_body.dart';
import 'package:ktu_results/mobile_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBeKMGBLg-axovy8NCQBnLt_0qKPgbTdkM",
          appId: "1:153607997104:web:b54b104cf1cbac0c00dd75",
          messagingSenderId: "153607997104",
          projectId: "ktu-edu-in-result"));
  await FirebaseAuth.instance.signInAnonymously();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Base());
}

ColorFilter mat = const ColorFilter.matrix(
    [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  void updateColorFilter(ColorFilter filter) {
    setState(() {
      mat = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: "APJ Abdul Kalam Technological University",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        datePickerTheme:
            const DatePickerThemeData(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: ColorFiltered(
        colorFilter: mat,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(screenWidth > 852 ? 53 : screenHeight * 0.15),
              child: Appbar(filter: updateColorFilter)),
            body: screenWidth > 700 ? InteractiveViewer(
              scaleEnabled: false,
              child: const AppBody(),
              ): const MobileBody()),
      ),
    );
  }
}
