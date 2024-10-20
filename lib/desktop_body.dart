import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

String _dropvalue = "--SELECT--";
bool _isClicked = false;
String _heading = "Examination Result";
List<String> _data = [
  "B.Tech S8 (S) Exam Aug 2024 (2019 Scheme) (S8 Result)",
  "B.Tech S8 (PT) (S) Exam August 2024 (2019 Scheme) (S8 Result",
  "B.Tech S3 (S, FE) Exam June 2024 (2019 Scheme) (S3 Result)",
  "B.Tech S5 (S, FE) Exam June 2024 (2019 Scheme) (S5 Result)",
  "B.Tech S6 (Minor) Exam June 2024 (2021 Admn) (S6 Result)",
  "B.Tech S6 (Hons.) Exam June 2024 (2021 Admn) (S6 Result)",
  "B.Tech S4 (minor) Exam June 2024 (2022 admn) (S4 Result)",
  "B.Tech S4 (Hons.) Exam June 2024 (2022 admn) (S4 Result)",
  "B.Tech S1 (S, FE) Exam June 2024 (2019 Scheme) (S1 Result)",
  "B.Tech S5 (S, FE) Exam June 2024 (2015 Scheme) (S5 Result)"
];

Map<String, int> _eachResult = {
  "--SELECT--": 0,
  "B.Tech": 1,
  "M.Tech": 2,
  "MBA": 3,
  "MCA": 4,
  "B.Arch": 5,
  "M.arch": 6,
  "Hotel": 7,
  "MHM": 8,
  "B.Plan": 9,
  "MCA2": 10,
  "MCA2deg": 11,
  "PhD": 12,
  "B.Des": 13,
  "MCA2Year": 14,
  "B.Voc": 15,
  "MBAINT": 16,
  "MBASPEC": 17,
  "BCA": 18,
  "BBA": 19,
};

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 90.0,
            child: Row(
              children: [
                const SizedBox(width: 10),
                SizedBox(
                  height: 175.0,
                  width: 175.0,
                  child: Image.asset("assets/images/logo.png"),
                ),
                styledTButton(
                    "Home", () => _launchUrl("https://ktu.edu.in/home")),
                styledPopup("University", {
                  "About us": () =>
                      _launchUrl("https://ktu.edu.in/university/about"),
                  "Values, Vision & Mission": () => _launchUrl(
                      "https://ktu.edu.in/university/visionandmission"),
                  "Acts and Statutes": () =>
                      _launchUrl("https://ktu.edu.in/university/statutes"),
                  "Meeting Minutes": () => _launchUrl(
                      "https://ktu.edu.in/university/meetingminutes"),
                }),
                styledPopup("People", {
                  "Board of Governors": () => _launchUrl(
                      "https://ktu.edu.in/administration/boardofgovernors"),
                  "Syndicate": () =>
                      _launchUrl("https://ktu.edu.in/administration/syndicate"),
                  "Authorities": () => _launchUrl(
                      "https://ktu.edu.in/administration/Authorities"),
                  "Statutory Officers": () => _launchUrl(
                      "https://ktu.edu.in/administration/StatutoryOfficers"),
                }),
                styledPopup("Affiliation", {
                  "Affiliated Instituitions": () => _launchUrl(
                      "https://ktu.edu.in/affiliation/affiliatedInstitutes"),
                  "NBA Accredited Institutions": () => _launchUrl(
                      "https://ktu.edu.in/affiliation/affiliationNBAAccreditedInstitutes"),
                  "Norms and Rules": () => _launchUrl(
                      "https://ktu.edu.in/affiliation/norms-and-rules"),
                  "Notifications": () => _launchUrl(
                      "https://ktu.edu.in/affiliation/affiliationNotification"),
                }),
                styledPopup("Academics", {
                  "Academic Calender": () => _launchUrl(
                      "https://ktu.edu.in/academics/academic_calendar"),
                  "Regulation & Syllabus": () =>
                      _launchUrl("https://ktu.edu.in/academics/scheme"),
                  "MOOC Courses": () =>
                      _launchUrl("https://ktu.edu.in/academics/mooccources"),
                  "CGPC": () => _launchUrl("https://ktu.edu.in/academics/cgpc"),
                  "Norms And Rules": () => _launchUrl(
                      "https://ktu.edu.in/academics/norms-and-rules"),
                  "Notification": () =>
                      _launchUrl("https://ktu.edu.in/academics/notification"),
                }),
                styledPopup("Examination", {
                  "Timetable": () =>
                      _launchUrl("https://ktu.edu.in/exam/Timetable"),
                  "Result": () => _launchUrl(""),
                  "Norms and Rules": () =>
                      _launchUrl("https://ktu.edu.in/exam/norms-and-rules"),
                  "Notification": () =>
                      _launchUrl("https://ktu.edu.in/exam/Notification")
                }),
                styledPopup("Research", {
                  "Plcaes of Reseacrh": () => _launchUrl(
                      "https://ktu.edu.in/research/PlaceOfResearchList"),
                  "Registered Reasearch Supervisors": () => _launchUrl(
                      "https://ktu.edu.in/research/placeofresearchs"),
                  "Registered Reseacrh Scholars": () => _launchUrl(
                      "https://ktu.edu.in/research/placeofresearchs"),
                  "Norms And Rules": () =>
                      _launchUrl("https://ktu.edu.in/research/norms-and-rules"),
                  "Notification": () =>
                      _launchUrl("https://ktu.edu.in/research/Notification"),
                }),
                styledPopup("IQAC", {
                  "About": () => _launchUrl("https://ktu.edu.in/iqac/IQACList"),
                  "HRDC Centers": () =>
                      _launchUrl("https://ktu.edu.in/iqac/hrdccenters")
                }),
                styledPopup("Legal", {
                  "RTI": () =>
                      _launchUrl("https://ktu.edu.in/miscellaneous/RTI")
                }),
                styledTButton(
                    "Jobs/Careers",
                    () => _launchUrl(
                        "https://ktu.edu.in/job&career/jobnotification")),
              ],
            ),
          ),
          Stack(
            children: [
              Image.asset("assets/images/banner.jpg",
                  width: double.infinity, fit: BoxFit.cover),
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.08,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.17,
                      ),
                      const Text(
                        "Exam",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        FontAwesomeIcons.chevronRight,
                        color: Colors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Result",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: screenHeight - 50,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                          padding:
                              const EdgeInsets.only(top: 14, right: 5, left: 5),
                          child: styledListTile(
                              "Timetable",
                              trail: true,
                              () => _launchUrl(
                                  "https://ktu.edu.in/exam/timetable"))),
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
                                () => _launchUrl(
                                    "https://ktu.edu.in/exam/norms-and-rules")),
                            const Divider(height: 0, indent: 4, endIndent: 4),
                            styledListTile(
                                "Notification",
                                () => _launchUrl(
                                    "https://ktu.edu.in/exam/notification")),
                            const Divider(height: 0, indent: 4, endIndent: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(width: 3.5),
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      const SizedBox(height: 2.5),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                _heading,
                                style: _heading == "Examination Result"
                                    ? const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)
                                    : const TextStyle(
                                        color: Color(0xff8b0051),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const Text(
                              "Program",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Color(0xff222222)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 22.0),
                              child: DropdownMenu<String>(
                                onSelected: (String? val) {
                                  setState(() {
                                    _dropvalue = val ?? "--SELECT--";
                                  });
                                },
                                enableSearch: false,
                                trailingIcon: const Icon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 12,
                                ),
                                selectedTrailingIcon: const Icon(
                                  FontAwesomeIcons.chevronUp,
                                  size: 12,
                                ),
                                initialSelection: "--SELECT--",
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 5.0, left: 8.0),
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 13.8),
                                  border: OutlineInputBorder(),
                                  constraints: BoxConstraints(maxHeight: 30),
                                  isDense: true,
                                ),
                                menuHeight: 350,
                                menuStyle: const MenuStyle(
                                    visualDensity: VisualDensity(vertical: -4),
                                    shadowColor:
                                        WidgetStatePropertyAll(Colors.black),
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.white)),
                                dropdownMenuEntries: <DropdownMenuEntry<
                                    String>>[
                                  const DropdownMenuEntry(
                                      value: "--SELECT--",
                                      label: "--SELECT--",
                                      enabled: false),
                                  customDropDown("B.Tech", "B.Tech"),
                                  customDropDown("M.Tech", "M.Tech"),
                                  customDropDown("MBA", "MBA"),
                                  customDropDown("MCA", "MCA"),
                                  customDropDown("B.Arch", "B.Arch"),
                                  customDropDown("M.Arch", "M.Arch"),
                                  customDropDown("Hotel",
                                      "Hotel Management and Catering Technology"),
                                  customDropDown("MHM", "MHM"),
                                  customDropDown("B.Plan", "B.Planning"),
                                  customDropDown(
                                      "MCA2", "MCA(Second Year Direct)"),
                                  customDropDown(
                                      "MCA2deg", "MCA Dual degree(INTEGRATED)"),
                                  customDropDown("PhD", "PhD"),
                                  customDropDown("B.Des", "B.Des"),
                                  customDropDown("MCA2Year", "MCA TWO YEARS"),
                                  customDropDown("B.Voc", "B.Voc"),
                                  customDropDown("MBAINT", "MBA INTEGRATED"),
                                  customDropDown(
                                      "MBASPEC", "MBA WITH SPECIALIZATION"),
                                  customDropDown("BCA", "BCA"),
                                  customDropDown("BBA", "BBA"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: _isClicked
                            ? const EdgeInsets.only(top: 20)
                            : const EdgeInsets.all(0),
                        child: SizedBox(
                          width: _isClicked ? 1130 : 1330,
                          height:
                              _dropvalue == "--SELECT--" || _isClicked == true
                                  ? 200
                                  : 750,
                          child: _isClicked
                              ? Card(
                                  elevation: 7,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 14.0,
                                                    vertical: 10.0),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Register Number",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.0),
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xffbbbfc1),
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            5.5),
                                                                  ),
                                                                ),
                                                                label: Text(
                                                                  "Enter Register Number",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Color(
                                                                          0xffbbbfc1)),
                                                                )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Flexible(
                                              flex: 1,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 14.0,
                                                    vertical: 10.0),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "Date Of Birth",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.0),
                                                      child: TextField(
                                                        readOnly: true,
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xffbbbfc1),
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(
                                                                                5.5))),
                                                                hintText:
                                                                    "mm/dd/yyyy",
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                suffixIcon:
                                                                    Icon(
                                                                  FontAwesomeIcons
                                                                      .calendar,
                                                                  size: 12.0,
                                                                )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 13),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: SizedBox(
                                            width: 143,
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor:
                                                    const Color(0xff6d52b1),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                "View Results",
                                                style:
                                                    TextStyle(fontSize: 16.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Card(
                                  surfaceTintColor: Colors.grey[400],
                                  color: Colors.white,
                                  elevation: 7,
                                  shadowColor: Colors.black,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  margin: const EdgeInsets.all(30),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            height: 30,
                                            child: const Text("Exam",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        const Divider(),
                                        resultField(),
                                      ]),
                                ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                color: const Color(0xff1d2733),
                width: double.infinity,
                height: 200,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 205, vertical: 25),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 220,
                          height: 80,
                          child: Image.asset("assets/images/logo_tr.png"),
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              iconBtns(
                                  FontAwesomeIcons.facebook,
                                  const Color(0xff395498),
                                  () => _launchUrl(
                                      "https://m.facebook.com/apjaktuofficial/")),
                              iconBtns(
                                  FontAwesomeIcons.linkedin,
                                  const Color(0xff0270ad),
                                  () => _launchUrl(
                                      "https://in.linkedin.com/school/apj-abdul-kalam-technological-university/")),
                              iconBtns(
                                  FontAwesomeIcons.instagram,
                                  const Color(0xffea4c56),
                                  () => _launchUrl(
                                      "https://instagram.com/keralatechnologicaluniversity/")),
                              iconBtns(
                                  FontAwesomeIcons.twitter,
                                  const Color(0xff029eec),
                                  () => _launchUrl(
                                      "https://twitter.com/apjaktuofficial")),
                              iconBtns(
                                  FontAwesomeIcons.youtube,
                                  const Color(0xfff60002),
                                  () => _launchUrl(
                                      "https://www.youtube.com/channel/UC4lFeTaXLEhOeharO9-WS6w/featured")),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.3),
                  const Text(
                    "Copyright@ APJ Abdul Kalam Technological University 2021",
                    style: TextStyle(color: Color(0xff898b8d)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  DropdownMenuEntry<String> customDropDown(dynamic value, String label) {
    return DropdownMenuEntry(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.white;
            }
            return Colors.black;
          }),
          overlayColor: const WidgetStatePropertyAll(Color(0xff005faf))),
      value: value,
      label: label,
    );
  }

  Widget iconBtns(IconData icon, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: IconButton.outlined(
          iconSize: 16,
          padding: const EdgeInsets.all(15),
          hoverColor: color,
          color: Colors.white,
          onPressed: onPressed,
          icon: Icon(icon)),
    );
  }

  Widget resultField() {
    if (_dropvalue == "--SELECT--" ||
        _eachResult[_dropvalue]! > 14 ||
        _eachResult[_dropvalue] == 8) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 60.5,
            child: Card(
              elevation: 3,
              color: Colors.white,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Center(
                child: Text("NO RECORDS FOUND",
                    style: TextStyle(
                        color: Color(0xff8b0051), fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: FutureBuilder<List<dynamic>>(
            future: publishedResult(_eachResult[_dropvalue] ?? 2),
            builder: (context, snapshot) {
              return ListView.separated(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  if (snapshot.hasData) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xff8b0051),
                        radius: 17,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 14.5,
                          child: CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xff8b0051),
                              child: Icon(FontAwesomeIcons.fileSignature,
                                  size: 16, color: Colors.white)),
                        ),
                      ),
                      title: _dropvalue == "B.Tech"
                          ? Text(
                              _data[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8b0051),
                              ),
                            )
                          : Text(
                              "${snapshot.data![index]['resultName']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8b0051),
                              ),
                            ),
                      subtitle: _dropvalue == "B.Tech"
                          ? Text(
                              "Published On: ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            )
                          : Text(
                              "Published On: ${(() {
                                String date =
                                    snapshot.data![index]['publishDate'];
                                List<String> newDate = date.split("-");
                                return "${newDate[2]}-${newDate[1]}-${newDate[0]}";
                              })()}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                      trailing: SizedBox(
                        height: 40,
                        width: 122.5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                backgroundColor: const Color(0xffebebeb)),
                            onPressed: () {
                              if (_dropvalue != "B.Tech") {
                                _launchUrl("");
                              } else {
                                setState(() {
                                  _isClicked = true;
                                  _heading = "Exam:  ${_data[index]}";
                                });
                              }
                            },
                            child: const Text("View Result")),
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {},
                    child: Container(
                      width: 900,
                      height: 50,
                      color: const Color.fromARGB(255, 202, 200, 200),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => const Divider(),
              );
            }),
      );
    }
  }

  Widget styledListTile(String text, VoidCallback onPressed,
      {bool selected = false,
      Color selectedTileColor = Colors.transparent,
      bool trail = false}) {
    return ListTile(
      selected: selected,
      selectedTileColor: selectedTileColor,
      minTileHeight: 1,
      horizontalTitleGap: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      selectedColor: Colors.white,
      hoverColor: const Color(0xff6d52b1),
      onTap: onPressed,
      title: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      trailing: trail
          ? const Icon(
              FontAwesomeIcons.chevronRight,
              size: 13,
              color: Colors.black,
            )
          : const SizedBox.shrink(),
    );
  }

  Widget styledTButton(String text, VoidCallback onPressed) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        ));
  }

  Widget styledPopup(String hint, Map<String, VoidCallback> data) {
    return Semantics(
      child: PopupMenuButton(
        tooltip: "",
        color: Colors.white,
        position: PopupMenuPosition.under,
        icon: Row(
          children: [
            Text(
              hint,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              size: 20.0,
            ),
          ],
        ),
        itemBuilder: (context) {
          return data.keys.toList().map((String each) {
            return PopupMenuItem(
              height: 35,
              value: each,
              onTap: data[each],
              child: Text(each),
            );
          }).toList();
        },
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  await launchUrlString(url);
}

Future<List<dynamic>> publishedResult(int index) async {
  var url = Uri.parse("http://127.0.0.1:8000");
  Map<String, String> headers = {"Content-Type": "application/json"};
  Map<String, String> data = {"index": "$index"};

  var response = await http.post(url, headers: headers, body: jsonEncode(data));
  return jsonDecode(response.body);
}
