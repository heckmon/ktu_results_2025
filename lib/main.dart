import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_results/app_bar.dart';
import 'package:ktu_results/desktop_body.dart';
import 'package:ktu_results/mobile_body.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Base());
}

ColorFilter mat = const ColorFilter.matrix([
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

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
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: ColorFiltered(
        colorFilter: mat,
        child: InteractiveViewer(
          scaleEnabled: screenHeight > 1200 && screenWidth > 700,
          child: Scaffold(
              resizeToAvoidBottomInset:false,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      screenWidth > 852 ? 53 : screenHeight * 0.15),
                  child: Appbar(filter: updateColorFilter)),
              body: screenWidth > 700 ? const AppBody() : const MobileBody()),
        ),
      ),
    );
  }
}
