import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ktu_results/desktop_body.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: screenWidth,
            height: 80.0,
            child: Row(
              children: [
                SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset("assets/images/logo.png")),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.bars, color: Colors.grey[600]))
              ],
            ),
          ),
          const Divider(),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: styledListTile(
                      "Timetable",
                      trail: true,
                      () => launchUrl("https://ktu.edu.in/exam/timetable"))),
              const Divider(height: 0, indent: 12, endIndent: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    styledListTile(
                        "Result",
                        selected: true,
                        selectedTileColor: const Color(0xff6d52b1),
                        () {}),
                    const Divider(height: 0, indent: 4, endIndent: 4),
                    styledListTile(
                        "Norms And Rules",
                        () => launchUrl(
                            "https://ktu.edu.in/exam/norms-and-rules")),
                    const Divider(height: 0, indent: 4, endIndent: 4),
                    styledListTile(
                        "Notification",
                        () =>
                            launchUrl("https://ktu.edu.in/exam/notification")),
                    const Divider(height: 0, indent: 4, endIndent: 4),
                  ],
                ),
              ),
            ],
          ),
          const Card(
              child: Column(
            children: [
              Text("Examination Results",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text("Program",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xff222222))),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
