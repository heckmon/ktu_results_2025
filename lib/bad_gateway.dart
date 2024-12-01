import 'package:flutter/material.dart';

class BadGateway extends StatelessWidget {
  const BadGateway({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            '502 Bad Gateway',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, fontFamily: "Arial"),
          ),
        ),
      ),
    );
  }
}
