import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_results/app_bar.dart';
import 'package:ktu_results/desktop_body.dart';

Future<void> main() async{
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    //final _screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        home: const Scaffold(appBar: Appbar(), body: AppBody()));
  }
}
