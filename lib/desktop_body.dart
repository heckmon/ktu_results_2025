import 'dart:convert';
import 'package:ktu_results/bad_gateway.dart';
import 'package:ktu_results/mobile_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ktu_results/result.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:html' as html;

// ignore_for_file: avoid_web_libraries_in_flutter
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

final formKey = GlobalKey<FormState>();
TextEditingController regNo = TextEditingController(),
    dob = TextEditingController();
String dropvalue = "--SELECT--", heading = "Examination Result";
bool isClicked = false,
    showResult = false,
    sideBarStat = false,
    captchaStat = false;

List<String> data = [
  "B.Tech S3 (S) Exam November 2024 (2019 Scheme) (S3 Result)",
  "B.Tech S8 (S) Exam Aug 2024 (2019 Scheme) (S8 Result)",
  "B.Tech S8 (PT) (S) Exam August 2024 (2019 Scheme) (S8 Result",
  "B.Tech S3 (S, FE) Exam June 2024 (2019 Scheme) (S3 Result)",
  "B.Tech S5 (S, FE) Exam June 2024 (2019 Scheme) (S5 Result)",
  "B.Tech S6 (Minor) Exam June 2024 (2021 Admn) (S6 Result)",
  "B.Tech S6 (Hons.) Exam June 2024 (2021 Admn) (S6 Result)",
  "B.Tech S4 (minor) Exam June 2024 (2022 admn) (S4 Result)",
  "B.Tech S4 (Hons.) Exam June 2024 (2022 admn) (S4 Result)",
  "B.Tech S1 (S, FE) Exam June 2024 (2019 Scheme) (S1 Result)",
];

Map<String, int> eachResult = {
  "--SELECT--": 0,
  "B.Tech": 1,
  "M.Tech": 2,
  "MBA": 3,
  "MCA": 4,
  "B.Arch": 5,
  "M.Arch": 6,
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

double screenWidth = 0, screenHeight = 0;
final focusNode = FocusNode();
final sidebtnChildren = [
  styledTButton(
    "Home",
    () => launchUrl("https://ktu.edu.in/home"),
  ),
  styledPopup(
    "University",
    {
      "About us": () => launchUrl("https://ktu.edu.in/university/about"),
      "Values, Vision & Mission": () =>
          launchUrl("https://ktu.edu.in/university/visionandmission"),
      "Acts and Statutes": () =>
          launchUrl("https://ktu.edu.in/university/statutes"),
      "Meeting Minutes": () =>
          launchUrl("https://ktu.edu.in/university/meetingminutes"),
    },
  ),
  styledPopup(
    "People",
    {
      "Board of Governors": () =>
          launchUrl("https://ktu.edu.in/administration/boardofgovernors"),
      "Syndicate": () =>
          launchUrl("https://ktu.edu.in/administration/syndicate"),
      "Authorities": () =>
          launchUrl("https://ktu.edu.in/administration/Authorities"),
      "Statutory Officers": () =>
          launchUrl("https://ktu.edu.in/administration/StatutoryOfficers"),
    },
  ),
  styledPopup(
    "Affiliation",
    {
      "Affiliated Instituitions": () =>
          launchUrl("https://ktu.edu.in/affiliation/affiliatedInstitutes"),
      "NBA Accredited Institutions": () => launchUrl(
          "https://ktu.edu.in/affiliation/affiliationNBAAccreditedInstitutes"),
      "Norms and Rules": () =>
          launchUrl("https://ktu.edu.in/affiliation/norms-and-rules"),
      "Notifications": () =>
          launchUrl("https://ktu.edu.in/affiliation/affiliationNotification"),
    },
  ),
  styledPopup(
    "Academics",
    {
      "Academic Calender": () =>
          launchUrl("https://ktu.edu.in/academics/academic_calendar"),
      "Regulation & Syllabus": () =>
          launchUrl("https://ktu.edu.in/academics/scheme"),
      "MOOC Courses": () =>
          launchUrl("https://ktu.edu.in/academics/mooccources"),
      "CGPC": () => launchUrl("https://ktu.edu.in/academics/cgpc"),
      "Norms And Rules": () =>
          launchUrl("https://ktu.edu.in/academics/norms-and-rules"),
      "Notification": () =>
          launchUrl("https://ktu.edu.in/academics/notification"),
    },
  ),
  styledPopup(
    "Examination",
    {
      "Timetable": () => launchUrl("https://ktu.edu.in/exam/Timetable"),
      "Result": () => launchUrl(""),
      "Norms and Rules": () =>
          launchUrl("https://ktu.edu.in/exam/norms-and-rules"),
      "Notification": () => launchUrl("https://ktu.edu.in/exam/Notification")
    },
  ),
  styledPopup(
    "Research",
    {
      "Plcaes of Reseacrh": () =>
          launchUrl("https://ktu.edu.in/research/PlaceOfResearchList"),
      "Registered Reasearch Supervisors": () =>
          launchUrl("https://ktu.edu.in/research/placeofresearchs"),
      "Registered Reseacrh Scholars": () =>
          launchUrl("https://ktu.edu.in/research/placeofresearchs"),
      "Norms And Rules": () =>
          launchUrl("https://ktu.edu.in/research/norms-and-rules"),
      "Notification": () =>
          launchUrl("https://ktu.edu.in/research/Notification"),
    },
  ),
  styledPopup(
    "IQAC",
    {
      "About": () => launchUrl("https://ktu.edu.in/iqac/IQACList"),
      "HRDC Centers": () => launchUrl("https://ktu.edu.in/iqac/hrdccenters")
    },
  ),
  styledPopup(
    "Legal",
    {"RTI": () => launchUrl("https://ktu.edu.in/miscellaneous/RTI")},
  ),
  styledTButton(
    "Jobs/Careers",
    () => launchUrl("https://ktu.edu.in/job&career/jobnotification"),
  ),
];
final styledTiles = [
  styledListTile(
      "Result",
      selected: true,
      selectedTileColor: const Color(0xff6d52b1),
      () {}),
  const Divider(height: 0, indent: 4, endIndent: 4),
  styledListTile("Norms And Rules",
      () => launchUrl("https://ktu.edu.in/exam/norms-and-rules")),
  const Divider(height: 0, indent: 4, endIndent: 4),
  styledListTile(
      "Notification", () => launchUrl("https://ktu.edu.in/exam/notification")),
  const Divider(height: 0, indent: 4, endIndent: 4),
];
final dropDowns = <DropdownMenuEntry<String>>[
  const DropdownMenuEntry(
      value: "--SELECT--", label: "--SELECT--", enabled: false),
  customDropDown("B.Tech", "B.Tech"),
  customDropDown("M.Tech", "M.Tech"),
  customDropDown("MBA", "MBA"),
  customDropDown("MCA", "MCA"),
  customDropDown("B.Arch", "B.Arch"),
  customDropDown("M.Arch", "M.Arch"),
  customDropDown("Hotel", "Hotel Management and Catering Technology"),
  customDropDown("MHM", "MHM"),
  customDropDown("B.Plan", "B.Planning"),
  customDropDown("MCA2", "MCA(Second Year Direct)"),
  customDropDown("MCA2deg", "MCA Dual degree(INTEGRATED)"),
  customDropDown("PhD", "PhD"),
  customDropDown("B.Des", "B.Des"),
  customDropDown("MCA2Year", "MCA TWO YEARS"),
  customDropDown("B.Voc", "B.Voc"),
  customDropDown("MBAINT", "MBA INTEGRATED"),
  customDropDown("MBASPEC", "MBA WITH SPECIALIZATION"),
  customDropDown("BCA", "BCA"),
  customDropDown("BBA", "BBA"),
];
final socialMedias = [
  iconBtns(FontAwesomeIcons.facebook, const Color(0xff395498),
      () => launchUrl("https://m.facebook.com/apjaktuofficial/")),
  iconBtns(
      FontAwesomeIcons.linkedin,
      const Color(0xff0270ad),
      () => launchUrl(
          "https://in.linkedin.com/school/apj-abdul-kalam-technological-university/")),
  iconBtns(FontAwesomeIcons.instagram, const Color(0xffea4c56),
      () => launchUrl("https://www.instagram.com/apjaktuofficial/")),
  iconBtns(FontAwesomeIcons.twitter, const Color(0xff029eec),
      () => launchUrl("https://twitter.com/apjaktuofficial")),
  iconBtns(
      FontAwesomeIcons.youtube,
      const Color(0xfff60002),
      () => launchUrl(
          "https://www.youtube.com/channel/UC4lFeTaXLEhOeharO9-WS6w/featured")),
];

class _AppBodyState extends State<AppBody> {
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  width: screenWidth,
                  height: screenHeight <= 1000 ? 97 : screenHeight * 0.06,
                  child: screenWidth > 1155
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: SizedBox(
                                width: 200,
                                child: Image.asset("assets/images/logo.png"),
                              ),
                            ),
                            ...sidebtnChildren,
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child:
                                          Image.asset("assets/images/logo.png"),
                                    ),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: IconButton.outlined(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      visualDensity: VisualDensity.standard,
                                      style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.5),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          sideBarStat = !sideBarStat;
                                        });
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.bars,
                                        color: Colors.grey[600],
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
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
                  width: screenWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 14, right: 5, left: 5),
                                child: styledListTile(
                                    "Timetable",
                                    trail: true,
                                    () => launchUrl(
                                        "https://ktu.edu.in/exam/timetable"))),
                            const Divider(height: 0, indent: 12, endIndent: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: styledTiles,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 0.75,
                            height: 1200 > screenHeight
                                ? screenHeight * 0.9
                                : screenHeight * 0.7,
                            color: Colors.grey,
                          ),
                          showResult && screenHeight < 1200
                              ? Container(
                                  width: 0.75,
                                  height: screenHeight * 0.9,
                                  color: Colors.grey,
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
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
                                    padding: isClicked
                                        ? const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 12.0)
                                        : const EdgeInsets.only(left: 12.0),
                                    child: Text(
                                      heading,
                                      style: heading == "Examination Result"
                                          ? const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)
                                          : const TextStyle(
                                              color: Color(0xff8b0051),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Visibility(
                                    visible: !isClicked,
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Program",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Color(0xff364a63)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 22.0),
                                          child: SizedBox(
                                            width: screenWidth * 0.2,
                                            child: DropdownMenu<String>(
                                              focusNode: focusNode,
                                              onSelected: (String? val) {
                                                setState(() {
                                                  dropvalue =
                                                      val ?? "--SELECT--";
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
                                                contentPadding: EdgeInsets.only(
                                                    bottom: 5.0, left: 8.0),
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13.8),
                                                border: OutlineInputBorder(),
                                                constraints: BoxConstraints(
                                                    maxHeight: 30),
                                                isDense: true,
                                              ),
                                              menuHeight: 350,
                                              menuStyle: const MenuStyle(
                                                  visualDensity: VisualDensity(
                                                      vertical: -4),
                                                  shadowColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.black),
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.white)),
                                              dropdownMenuEntries: dropDowns,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: isClicked
                                  ? const EdgeInsets.only(top: 20)
                                  : const EdgeInsets.all(0),
                              child: SizedBox(
                                width: isClicked ? 1130 : screenWidth * 0.7,
                                height: dropvalue == "--SELECT--"
                                    ? 200
                                    : screenHeight > 1200
                                        ? isClicked
                                            ? 300
                                            : 800
                                        : isClicked
                                            ? 295
                                            : screenHeight * 0.8,
                                child: isClicked
                                    ? Form(
                                        key: formKey,
                                        child: Card(
                                          elevation: 7,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    14.0,
                                                                vertical: 10.0),
                                                        child: Column(
                                                          children: [
                                                            const Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                "Register Number",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 8.0),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    regNo,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return "Mandatory field";
                                                                  }
                                                                  return null;
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
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
                                                                              BorderRadius.all(
                                                                            Radius.circular(5.5),
                                                                          ),
                                                                        ),
                                                                        label:
                                                                            Text(
                                                                          "Enter Register Number",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              color: Color(0xffbbbfc1)),
                                                                        )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Flexible(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    14.0,
                                                                vertical: 10.0),
                                                        child: Column(
                                                          children: [
                                                            const Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                "Date Of Birth",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 8.0),
                                                              child:
                                                                  TextFormField(
                                                                onTap:
                                                                    () async {
                                                                  date =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            1990,
                                                                            1,
                                                                            1),
                                                                    lastDate:
                                                                        DateTime
                                                                            .now(),
                                                                  );
                                                                  if (date !=
                                                                      null) {
                                                                    setState(
                                                                        () {
                                                                      date =
                                                                          date;
                                                                      dob.text =
                                                                          "${date!.day}/${date!.month}/${date!.year}";
                                                                    });
                                                                  }
                                                                },
                                                                controller: dob,
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return "Mandatory field";
                                                                  }
                                                                  return null;
                                                                },
                                                                readOnly: true,
                                                                decoration: const InputDecoration(
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                          color:
                                                                              Color(0xffbbbfc1),
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius: BorderRadius.all(Radius.circular(5.5))),
                                                                    hintText: "mm/dd/yyyy",
                                                                    hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                                                                    suffixIcon: Icon(
                                                                      FontAwesomeIcons
                                                                          .calendar,
                                                                      size:
                                                                          12.0,
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          screenHeight > 1200
                                                              ? 10
                                                              : 14.5,
                                                      vertical: 20),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  3)),
                                                      color: const Color(
                                                          0xfff9f9f9),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Colors.grey),
                                                    ),
                                                    width: 310,
                                                    height: 77,
                                                    child: Center(
                                                      child: ListTile(
                                                        dense: true,
                                                        leading:
                                                            Transform.scale(
                                                          scale: 1.5,
                                                          child: Checkbox(
                                                              side: BorderSide(
                                                                  color: (!isChecked &&
                                                                          captchaStat)
                                                                      ? const Color.fromARGB(
                                                                          255,
                                                                          236,
                                                                          10,
                                                                          10)
                                                                      : Colors
                                                                          .grey,
                                                                  width: (!isChecked &&
                                                                              captchaStat) &&
                                                                          (dob.text != "" &&
                                                                              regNo.text !=
                                                                                  "")
                                                                      ? 1.1
                                                                      : 0.5),
                                                              checkColor:
                                                                  Colors.green,
                                                              activeColor: Colors
                                                                  .transparent,
                                                              value: isChecked,
                                                              isError:
                                                                  (!isChecked &&
                                                                      captchaStat),
                                                              onChanged:
                                                                  (bool? val) {
                                                                setState(() {
                                                                  isChecked =
                                                                      true;
                                                                });
                                                              }),
                                                        ),
                                                        title: Text(
                                                          "I'm not a robot",
                                                          style: TextStyle(
                                                              color: !isChecked &&
                                                                      captchaStat
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15),
                                                        ),
                                                        trailing: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Flexible(
                                                                flex: 1,
                                                                child: screenHeight >
                                                                        1220
                                                                    ? Transform
                                                                        .scale(
                                                                        scale:
                                                                            1.2,
                                                                        child: Image.asset(
                                                                            "assets/images/recaptcha.png"),
                                                                      )
                                                                    : Transform
                                                                        .scale(
                                                                        scale:
                                                                            1.7,
                                                                        child: Image.asset(
                                                                            "assets/images/recaptcha.png"),
                                                                      ),
                                                              ),
                                                              const Flexible(
                                                                flex: 1,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 2.5),
                                                                  child: Text(
                                                                      "reCAPTCHA",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10.5)),
                                                                ),
                                                              ),
                                                              const Flexible(
                                                                flex: 1,
                                                                child: Text(
                                                                  "Privacy - Terms",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          8),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 13),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: SizedBox(
                                                    width: 143,
                                                    height: 40,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        foregroundColor:
                                                            Colors.white,
                                                        backgroundColor:
                                                            const Color(
                                                                0xff6d52b1),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          if (isChecked) {
                                                            if (dropvalue ==
                                                                    "B.Tech" &&
                                                                heading.substring(
                                                                        7) ==
                                                                    data[0]) {
                                                              await getStudentData(
                                                                  regNo.text);
                                                              setState(() {
                                                                showResult =
                                                                    true;
                                                              });
                                                            } else {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushReplacement(
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const BadGateway()));
                                                            }
                                                          } else {
                                                            setState(() {
                                                              captchaStat =
                                                                  true;
                                                            });
                                                          }
                                                        }
                                                      },
                                                      child: const Text(
                                                        "View Results",
                                                        style: TextStyle(
                                                            fontSize: 16.5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Card(
                                        surfaceTintColor: Colors.grey[400],
                                        color: Colors.white,
                                        elevation: 7,
                                        shadowColor: Colors.black,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3))),
                                        margin: const EdgeInsets.all(30),
                                        child: ListView(children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            height: 30,
                                            child: const Text(
                                              "Exam",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Divider(),
                                          resultField(),
                                        ]),
                                      ),
                              ),
                            ),
                            showResult
                                ? const SizedBox(width: 1130, child: Result())
                                : const SizedBox.shrink()
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
                      width: screenWidth,
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
                                width: screenWidth * 0.2,
                                height: 80,
                                child: Image.asset("assets/images/logo_tr.png"),
                              ),
                              const Expanded(child: SizedBox()),
                              SizedBox(
                                child: Row(
                                  children: socialMedias,
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
                ),
              ],
            ),
            Visibility(
              visible: sideBarStat,
              child: Positioned(
                top: 75,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  width: screenWidth,
                  child: screenWidth > 950
                      ? Row(
                          children: sidebtnChildren,
                        )
                      : Wrap(children: sidebtnChildren),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget resultField() {
    if (dropvalue == "--SELECT--" ||
        eachResult[dropvalue]! > 14 ||
        eachResult[dropvalue] == 8) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 60.5,
            child: Card(
              elevation: 3,
              color: Colors.white,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Center(
                child: Text(
                  "NO RECORDS FOUND",
                  style: TextStyle(
                      color: Color(0xff8b0051),
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: screenHeight > 1200 ? 694 : screenHeight * 0.688,
        child: FutureBuilder<List<dynamic>>(
          future: publishedResult(eachResult[dropvalue] ?? 2),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: 10,
                itemBuilder: (ctx, index) {
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
                    title: dropvalue == "B.Tech"
                        ? Text(
                            data[index],
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
                    subtitle: dropvalue == "B.Tech"
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
                            setState(() {
                              isClicked = true;
                            });
                            if (dropvalue != "B.Tech") {
                              setState(() {
                                heading =
                                    'Exam: ${snapshot.data![index]["resultName"]}';
                              });
                            } else {
                              setState(() {
                                heading = "Exam:  ${data[index]}";
                              });
                            }
                          },
                          child: const Text("View Result")),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => const Divider(),
              );
            }
            return RefreshIndicator(
                child: const Center(
                    child: CircularProgressIndicator(color: Color(0xff0071d1))),
                onRefresh: () async {});
          },
        ),
      );
    }
  }
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

Future<void> launchUrl(String url) async {
  await launchUrlString(url);
}

Future<List<dynamic>> publishedResult(int index) async {
  var url = Uri.parse("https://proxy-vert-tau.vercel.app/");
  Map<String, String> headers = {
    "Content-Type": "application/json",
  };
  Map<String, String> data = {"index": "$index"};

  String? cachedData = html.window.localStorage['publishedResult_$index'];
  String? cachedTimestamp =
      html.window.localStorage['publishedResult_${index}_timestamp'];

  if (cachedData != null && cachedTimestamp != null) {
    var cacheAge =
        DateTime.now().millisecondsSinceEpoch - int.parse(cachedTimestamp);
    if (cacheAge < 3600000) {
      return jsonDecode(cachedData);
    }
  }

  var response = await http.post(url, headers: headers, body: jsonEncode(data));
  html.window.localStorage['publishedResult_$index'] = response.body;
  html.window.localStorage['publishedResult_${index}_timestamp'] =
      DateTime.now().millisecondsSinceEpoch.toString();

  return jsonDecode(response.body);
}
