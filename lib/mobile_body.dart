import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ktu_results/desktop_body.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

bool sideBarStat = false;
bool isChecked = false;
bool showResult = false;
DateTime? date;
final _formKey = GlobalKey<FormState>();
TextEditingController regNo = TextEditingController();
TextEditingController dob = TextEditingController();

class _MobileBodyState extends State<MobileBody> {
  Future<DateTime?> _showDate() async {
    final date = await showDatePickerDialog(
      context: context,
      initialDate: DateTime.now(),
      minDate: DateTime(1990, 10, 10),
      maxDate: DateTime.now(),
    );
    return date;
  }

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
                      children: styledTiles,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        heading,
                        style: heading == "Examination Result"
                            ? const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)
                            : const TextStyle(
                                color: Color(0xff8b0051),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    isClicked
                        ? const SizedBox(height: 25.5)
                        : Row(
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
                                    inputDecorationTheme:
                                        const InputDecorationTheme(
                                      contentPadding: EdgeInsets.only(
                                          bottom: 5.0, left: 8.0),
                                      hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 13.8),
                                      border: OutlineInputBorder(),
                                      constraints:
                                          BoxConstraints(maxHeight: 30),
                                      isDense: true,
                                    ),
                                    menuHeight: 350,
                                    menuStyle: const MenuStyle(
                                        visualDensity:
                                            VisualDensity(vertical: -4),
                                        shadowColor: WidgetStatePropertyAll(
                                            Colors.black),
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.white)),
                                    dropdownMenuEntries: dropDowns,
                                  ),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: screenWidth,
                    height: dropvalue == "--SELECT--"
                        ? isClicked
                            ? screenHeight * 0.4
                            : 230
                        : screenHeight * 0.8,
                    child: isClicked
                        ? Card(
                            elevation: 7,
                            color: Colors.white,
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, bottom: 10, left: 10),
                                    child: Text(
                                      "Register Number",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Mandatory field";
                                        }
                                        return null;
                                      },
                                      controller: regNo,
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffbbbfc1),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.5),
                                            ),
                                          ),
                                          label: Text(
                                            "Enter Register Number",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffbbbfc1)),
                                          )),
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, bottom: 10, left: 10),
                                    child: Text(
                                      "Date Of Birth",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Mandatory field";
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        date = await _showDate();
                                        if (date != null) {
                                          setState(() {
                                            date = date;
                                            dob.text =
                                                "${date!.day}/${date!.month}/${date!.year}";
                                          });
                                        }
                                      },
                                      controller: dob,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xffefefef),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffbbbfc1),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.5))),
                                          hintText: date == null
                                              ? ""
                                              : "${date!.day}/${date!.month}/${date!.year}",
                                          hintStyle: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                          suffixIcon: const Icon(
                                            FontAwesomeIcons.chevronDown,
                                            size: 12.0,
                                          )),
                                    ),
                                  ),
                                ),
                                const FakeCaptcha(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
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
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {}
                                          setState(() {
                                            showResult = true;
                                          });
                                        },
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
                            children: socialMedias,
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
                  children: sidebtnChildren,
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
                      child:
                          CircularProgressIndicator(color: Color(0xff0071d1))),
                  onRefresh: () async {});
            },
          ),
        ),
      );
    }
  }
}
