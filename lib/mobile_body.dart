import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ktu_results/desktop_body.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

bool sideBarStat = false;

class _MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                width: screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 175,
                          height: screenHeight * 0.1,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        const Expanded(child: SizedBox()),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton.outlined(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              visualDensity: VisualDensity.standard,
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.5),
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
              const Divider(),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: styledListTile(
                          "Timetable",
                          trail: true,
                          () =>
                              launchUrl("https://ktu.edu.in/exam/timetable"))),
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
                            () => launchUrl(
                                "https://ktu.edu.in/exam/notification")),
                        const Divider(height: 0, indent: 4, endIndent: 4),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text("Examination Results",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Program",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color(0xff364a63),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.76,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 15),
                            child: DropdownMenu<String>(
                              onSelected: (String? val) {
                                setState(() {
                                  dropvalue = val ?? "--SELECT--";
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
                              inputDecorationTheme: const InputDecorationTheme(
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
                              dropdownMenuEntries: <DropdownMenuEntry<String>>[
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
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: isClicked
                    ? const EdgeInsets.only(top: 20)
                    : const EdgeInsets.all(0),
                child: SizedBox(
                  width: screenWidth,
                  height: dropvalue == "--SELECT--" || isClicked == true
                      ? 230
                      : screenHeight * 0.8,
                  child: isClicked
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
                                            horizontal: 14.0, vertical: 10.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Register Number",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xffbbbfc1),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5.5),
                                                      ),
                                                    ),
                                                    label: Text(
                                                      "Enter Register Number",
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                          horizontal: 14.0, vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Date Of Birth",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: TextField(
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xffbbbfc1),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5.5))),
                                                  hintText: "mm/dd/yyyy",
                                                  hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  suffixIcon: Icon(
                                                    FontAwesomeIcons.calendar,
                                                    size: 12.0,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 13),
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
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "View Results",
                                        style: TextStyle(fontSize: 16.5),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 30,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Exam",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                resultField(),
                              ]),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    Container(
                      color: const Color(0xff1d2733),
                      width: screenWidth,
                      height: screenHeight * 0.3,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.5, top: 25),
                            child: SizedBox(
                              width: 220,
                              height: 80,
                              child: Image.asset("assets/images/logo_tr.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              iconBtns(
                                  FontAwesomeIcons.facebook,
                                  const Color(0xff395498),
                                  () => launchUrl(
                                      "https://m.facebook.com/apjaktuofficial/")),
                              iconBtns(
                                  FontAwesomeIcons.linkedin,
                                  const Color(0xff0270ad),
                                  () => launchUrl(
                                      "https://in.linkedin.com/school/apj-abdul-kalam-technological-university/")),
                              iconBtns(
                                  FontAwesomeIcons.instagram,
                                  const Color(0xffea4c56),
                                  () => launchUrl(
                                      "https://instagram.com/keralatechnologicaluniversity/")),
                              iconBtns(
                                  FontAwesomeIcons.twitter,
                                  const Color(0xff029eec),
                                  () => launchUrl(
                                      "https://twitter.com/apjaktuofficial")),
                              iconBtns(
                                  FontAwesomeIcons.youtube,
                                  const Color(0xfff60002),
                                  () => launchUrl(
                                      "https://www.youtube.com/channel/UC4lFeTaXLEhOeharO9-WS6w/featured")),
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
              )
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
                child: Wrap(
                  children: [
                    styledTButton(
                      "Home",
                      () => launchUrl("https://ktu.edu.in/home"),
                    ),
                    styledPopup(
                      "University",
                      {
                        "About us": () =>
                            launchUrl("https://ktu.edu.in/university/about"),
                        "Values, Vision & Mission": () => launchUrl(
                            "https://ktu.edu.in/university/visionandmission"),
                        "Acts and Statutes": () =>
                            launchUrl("https://ktu.edu.in/university/statutes"),
                        "Meeting Minutes": () => launchUrl(
                            "https://ktu.edu.in/university/meetingminutes"),
                      },
                    ),
                    styledPopup(
                      "People",
                      {
                        "Board of Governors": () => launchUrl(
                            "https://ktu.edu.in/administration/boardofgovernors"),
                        "Syndicate": () => launchUrl(
                            "https://ktu.edu.in/administration/syndicate"),
                        "Authorities": () => launchUrl(
                            "https://ktu.edu.in/administration/Authorities"),
                        "Statutory Officers": () => launchUrl(
                            "https://ktu.edu.in/administration/StatutoryOfficers"),
                      },
                    ),
                    styledPopup(
                      "Affiliation",
                      {
                        "Affiliated Instituitions": () => launchUrl(
                            "https://ktu.edu.in/affiliation/affiliatedInstitutes"),
                        "NBA Accredited Institutions": () => launchUrl(
                            "https://ktu.edu.in/affiliation/affiliationNBAAccreditedInstitutes"),
                        "Norms and Rules": () => launchUrl(
                            "https://ktu.edu.in/affiliation/norms-and-rules"),
                        "Notifications": () => launchUrl(
                            "https://ktu.edu.in/affiliation/affiliationNotification"),
                      },
                    ),
                    styledPopup(
                      "Academics",
                      {
                        "Academic Calender": () => launchUrl(
                            "https://ktu.edu.in/academics/academic_calendar"),
                        "Regulation & Syllabus": () =>
                            launchUrl("https://ktu.edu.in/academics/scheme"),
                        "MOOC Courses": () => launchUrl(
                            "https://ktu.edu.in/academics/mooccources"),
                        "CGPC": () =>
                            launchUrl("https://ktu.edu.in/academics/cgpc"),
                        "Norms And Rules": () => launchUrl(
                            "https://ktu.edu.in/academics/norms-and-rules"),
                        "Notification": () => launchUrl(
                            "https://ktu.edu.in/academics/notification"),
                      },
                    ),
                    styledPopup(
                      "Examination",
                      {
                        "Timetable": () =>
                            launchUrl("https://ktu.edu.in/exam/Timetable"),
                        "Result": () => launchUrl(""),
                        "Norms and Rules": () => launchUrl(
                            "https://ktu.edu.in/exam/norms-and-rules"),
                        "Notification": () =>
                            launchUrl("https://ktu.edu.in/exam/Notification")
                      },
                    ),
                    styledPopup(
                      "Research",
                      {
                        "Plcaes of Reseacrh": () => launchUrl(
                            "https://ktu.edu.in/research/PlaceOfResearchList"),
                        "Registered Reasearch Supervisors": () => launchUrl(
                            "https://ktu.edu.in/research/placeofresearchs"),
                        "Registered Reseacrh Scholars": () => launchUrl(
                            "https://ktu.edu.in/research/placeofresearchs"),
                        "Norms And Rules": () => launchUrl(
                            "https://ktu.edu.in/research/norms-and-rules"),
                        "Notification": () => launchUrl(
                            "https://ktu.edu.in/research/Notification"),
                      },
                    ),
                    styledPopup(
                      "IQAC",
                      {
                        "About": () =>
                            launchUrl("https://ktu.edu.in/iqac/IQACList"),
                        "HRDC Centers": () =>
                            launchUrl("https://ktu.edu.in/iqac/hrdccenters")
                      },
                    ),
                    styledPopup(
                      "Legal",
                      {
                        "RTI": () =>
                            launchUrl("https://ktu.edu.in/miscellaneous/RTI")
                      },
                    ),
                    styledTButton(
                      "Jobs/Careers",
                      () => launchUrl(
                          "https://ktu.edu.in/job&career/jobnotification"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget resultField() {
    if (dropvalue == "--SELECT--" ||
        eachResult[dropvalue]! > 14 ||
        eachResult[dropvalue] == 8) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SizedBox(
            width: double.infinity,
            height: 65.5,
            child: Card(
              elevation: 3,
              color: Colors.white,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Center(
                child: Text("NO RECORDS FOUND",
                    style: TextStyle(
                        color: Color(0xff8b0051),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: SizedBox(
          height: screenHeight * 0.5,
          child: FutureBuilder<List<dynamic>>(
              future: publishedResult(eachResult[dropvalue] ?? 2),
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
                                if (dropvalue != "B.Tech") {
                                  launchUrl("");
                                } else {
                                  setState(() {
                                    isClicked = true;
                                    heading = "Exam:  ${data[index]}";
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
                        width: screenWidth,
                        height: 50,
                        color: const Color.fromARGB(255, 111, 111, 111),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => const Divider(),
                );
              }),
        ),
      );
    }
  }
}