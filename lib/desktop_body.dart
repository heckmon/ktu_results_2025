import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
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
                "Meeting Minutes": () =>
                    _launchUrl("https://ktu.edu.in/university/meetingminutes"),
              }),
              styledPopup("People", {
                "Board of Governors": () => _launchUrl(
                    "https://ktu.edu.in/administration/boardofgovernors"),
                "Syndicate": () =>
                    _launchUrl("https://ktu.edu.in/administration/syndicate"),
                "Authorities": () =>
                    _launchUrl("https://ktu.edu.in/administration/Authorities"),
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
                "Norms And Rules": () =>
                    _launchUrl("https://ktu.edu.in/academics/norms-and-rules"),
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
                "Registered Reasearch Supervisors": () =>
                    _launchUrl("https://ktu.edu.in/research/placeofresearchs"),
                "Registered Reseacrh Scholars": () =>
                    _launchUrl("https://ktu.edu.in/research/placeofresearchs"),
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
                "RTI": () => _launchUrl("https://ktu.edu.in/miscellaneous/RTI")
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
        Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: ListView(
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
                    Flexible(
                      flex: 1,
                      child: Container(
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
                            const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Examination Results",
                                style: TextStyle(
                                    fontSize: 20.0,
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
                              child: DropdownMenu(
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
                                dropdownMenuEntries: const [
                                  DropdownMenuEntry(
                                      value: "--SELECT--", label: "--SELECT--"),
                                  DropdownMenuEntry(
                                      value: "B.Tech", label: "B.Tech"),
                                  DropdownMenuEntry(
                                      value: "M.Tech", label: "M.Tech"),
                                  DropdownMenuEntry(value: "MBA", label: "MBA"),
                                  DropdownMenuEntry(value: "MCA", label: "MCA"),
                                  DropdownMenuEntry(
                                      value: "B.Arch", label: "B.Arch"),
                                  DropdownMenuEntry(
                                      value: "M.Arch", label: "M.Arch"),
                                  DropdownMenuEntry(
                                      value: "Hotel",
                                      label:
                                          "Hotel Management and Catering Technology"),
                                  DropdownMenuEntry(value: "MHM", label: "MHM"),
                                  DropdownMenuEntry(
                                      value: "M.Plan", label: "B.Planning"),
                                  DropdownMenuEntry(
                                      value: "MCA2",
                                      label: "MCA(Second Year Direct)"),
                                  DropdownMenuEntry(
                                      value: "MCA2deg",
                                      label: "MCA Dual degree(INTEGRATED)"),
                                  DropdownMenuEntry(value: "PhD", label: "PhD"),
                                  DropdownMenuEntry(
                                      value: "B.Des", label: "B.Des"),
                                  DropdownMenuEntry(
                                      value: "MCA2Year",
                                      label: "MCA TWO YEARS"),
                                  DropdownMenuEntry(
                                      value: "B.Voc", label: "B.Voc"),
                                  DropdownMenuEntry(
                                      value: "MBAINT", label: "MBA INTEGRATED"),
                                  DropdownMenuEntry(
                                      value: "MBASPEC",
                                      label: "MBA WITH SPECIALIZATION"),
                                  DropdownMenuEntry(value: "BBA", label: "BBA"),
                                  DropdownMenuEntry(value: "BCA", label: "BCA"),
                                ],
                                onSelected: (val) {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 9,
                        child: SizedBox(
                          width: 1330,
                          height: 200,
                          child: Card(
                            shadowColor: Colors.black,
                            shape: const BeveledRectangleBorder(),
                            margin: const EdgeInsets.all(30),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 30,
                                      child: const Text("Exam")),
                                  const Divider()
                                ]),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
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
        tooltip:"",
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
