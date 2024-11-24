import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ktu_results/desktop_body.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

FirebaseFirestore db = FirebaseFirestore.instance;

String studentName = "", registerNumber = "";
Map<dynamic, dynamic> grades = {};

class _ResultState extends State<Result> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9.5),
                child: Text(
                  heading,
                  style: const TextStyle(
                      color: Color(0xff8b0051),
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(width: 0.5, color: Colors.grey),
                  children: [
                    TableRow(children: [
                      customCell("Name"),
                      customCell(studentName)
                    ]),
                    TableRow(children: [
                      customCell("College"),
                      customCell("COLLEGE OF ENGINEERING ATTINGAL"),
                    ]),
                    TableRow(children: [
                      customCell("Register Number"),
                      customCell(registerNumber),
                    ]),
                    TableRow(children: [
                      customCell("Semester"),
                      customCell("S3"),
                    ]),
                    TableRow(children: [
                      customCell("Branch"),
                      customCell("COMPUTER SCIENCE & ENGINEERING"),
                    ]),
                    TableRow(children: [
                      customCell("Exam Month and Year"),
                      customCell("November-2024"),
                    ]),
                    TableRow(children: [
                      customCell("Exam"),
                      customCell(heading),
                    ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(0.5),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(width: 0.5, color: Colors.grey),
                  children: [
                    TableRow(children: [
                      resultCell("SL",
                          bgcolor: const Color(0xff8b0051),
                          textColor: Colors.white),
                      resultCell("COURSE",
                          bgcolor: const Color(0xffb8314f),
                          textColor: Colors.white),
                      resultCell("GRADE",
                          bgcolor: const Color(0xffda6049),
                          textColor: Colors.white),
                      resultCell("CREDITS",
                          bgcolor: const Color(0xffec6e45),
                          textColor: Colors.white),
                    ]),
                    TableRow(children: [
                      resultCell("1"),
                      resultCell("DATA STRUCTURES",
                          alignment: Alignment.centerLeft),
                      resultCell(grades["CST201"] ?? ""),
                      resultCell(grades["CST201"] == "F" ? "0" : "4"),
                    ]),
                    TableRow(children: [
                      resultCell("2"),
                      resultCell("DATA STRUCTURES LAB",
                          alignment: Alignment.centerLeft),
                      resultCell(grades["CSL201"] ?? ""),
                      resultCell(grades["CSL201"] == "F" ? "0" : "2"),
                    ]),
                    TableRow(children: [
                      resultCell("3"),
                      resultCell("DESIGN AND ENGINEERING",
                          alignment: Alignment.centerLeft),
                      resultCell(grades["EST200"] ?? ""),
                      resultCell(grades["EST200"] == "F" ? "0" : "2"),
                    ]),
                    TableRow(children: [
                      resultCell("4"),
                      resultCell("DISCRETE MATHEMATICAL STRUCTURES",
                          alignment: Alignment.centerLeft),
                      resultCell(grades["MAT203"] ?? ""),
                      resultCell(grades["MAT203"] == "F" ? "0" : "4"),
                    ]),
                    TableRow(children: [
                      resultCell("5"),
                      resultCell("LOGIC SYSTEM DESIGN",
                          alignment: Alignment.centerLeft),
                      resultCell(grades["CST203"] ?? ""),
                      resultCell(grades["CST203"] == "F" ? "0" : "4"),
                    ]),
                    TableRow(children: [
                      resultCell("6"),
                      resultCell("OBJECT ORIENTED PROGRAMMING USING JAVA",
                          alignment: Alignment.centerLeft),
                      resultCell(grades["CST205"] ?? ""),
                      resultCell(grades["CST205"] == "F" ? "0" : "4"),
                    ]),
                    TableRow(children: [
                      resultCell("7"),
                      resultCell("OBJECT ORIENTED PROGRAMMING LAB (IN JAVA)",
                          alignment: Alignment.centerLeft),
                      resultCell(grades["CSL203"] ?? ""),
                      resultCell(grades["CSL203"] == "F" ? "0" : "2"),
                    ]),
                    TableRow(children: [
                      resultCell("8"),
                      resultCell("SUSTAINABLE ENGINEERING",
                          alignment: Alignment.centerLeft),
                      resultCell("P"),
                      resultCell("0"),
                    ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Card(
          elevation: 3,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  color: const Color(0xff8b0051),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 6),
                      child: Text(
                        "Grading Rules",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "S",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("90% and above"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "A+",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("85% and above but less than 90%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "A",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("80% and above but less than 85%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "B+",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("75% and above but less than 80%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "B",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("70% and above but less than 75%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "C+",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("65% and above but less than 70%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "C",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("60% and above but less than 65%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "D",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("55% and above but less than 60%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "P",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("50% and above but less than 55%"),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff0dce7),
                    child: Text(
                      "F",
                      style: TextStyle(
                          color: Color(0xff8b0051),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  title: Text("Below 50% (CIE+ESE) or Below 40% for ESE"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

TableCell resultCell(String text,
    {Color textColor = Colors.black,
    Color bgcolor = Colors.transparent,
    AlignmentGeometry alignment = Alignment.center}) {
  return TableCell(
    child: Container(
      color: bgcolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Align(
          alignment: alignment,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth < 448 ? 12.5 : 15),
          ),
        ),
      ),
    ),
  );
}

TableCell customCell(String text) {
  return TableCell(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Future<void> getStudentData(String reg) async {
  CollectionReference students = db.collection('students');
  DocumentSnapshot doc = await students.doc(reg).get();
  if (doc.exists) {
    registerNumber = reg;
    studentName = doc.get("name");
    grades = doc.get("grades");
  } else {
    studentName = "none";
  }
}
