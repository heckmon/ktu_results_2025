import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(ColorFilter) filter;
  const Appbar({super.key, required this.filter});

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(45.0);
}

Map<String, bool> hover = {};
double screenWidth = 0;
double screenHeight = 0;

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    bool isNarrowScreen = screenWidth < 965 ? true : false;
    return screenWidth > 850
        ? AppBar(
            flexibleSpace: Row(
              children: [
                const SizedBox(width: 25.0),
                styledTextButton(
                    "Events", FontAwesomeIcons.calendarDays, isNarrowScreen,
                    () async {
                  await launchUrl(Uri.parse("https://ktu.edu.in/Menu/events"));
                }),
                styledTextButton(
                    "Announcements", FontAwesomeIcons.bullhorn, isNarrowScreen,
                    () async {
                  await launchUrl(
                      Uri.parse("https://ktu.edu.in/Menu/announcements"));
                }),
                styledTextButton(
                    "Gallery", FontAwesomeIcons.solidImage, isNarrowScreen,
                    () async {
                  await launchUrl(Uri.parse("https://ktu.edu.in/Menu/gallery"));
                }),
                styledTextButton(
                    "Contact us", FontAwesomeIcons.globe, isNarrowScreen,
                    () async {
                  await launchUrl(
                      Uri.parse("https://ktu.edu.in/Menu/contactus"));
                }),
                styledTextButton(
                    "Tenders", FontAwesomeIcons.gavel, isNarrowScreen,
                    () async {
                  await launchUrl(Uri.parse("https://ktu.edu.in/Menu/tenders"));
                }),
                const Expanded(child: SizedBox()),
                TextButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse("https://etis-2025.org/"));
                    },
                    child: const Text("ETIS",
                        style: TextStyle(color: Colors.white, fontSize: 15))),
                styledIconButton(Colors.white, Colors.black,
                    FontAwesomeIcons.droplet, 13.75, 5.5, () {
                  widget.filter(const ColorFilter.matrix([
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
                  ]));
                }),
                styledIconButton(const Color(0xff989a9e), Colors.white,
                    FontAwesomeIcons.droplet, 13.75, 5.5, () {
                  widget.filter(const ColorFilter.matrix([
                    0.33,
                    0.33,
                    0.33,
                    0,
                    0,
                    0.33,
                    0.33,
                    0.33,
                    0,
                    0,
                    0.33,
                    0.33,
                    0.33,
                    0,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                  ]));
                }),
                styledIconButton(const Color(0xff1d2733), Colors.white,
                    FontAwesomeIcons.droplet, 13.75, 5.5, () {
                  widget.filter(const ColorFilter.matrix([
                    -1,
                    0,
                    0,
                    0,
                    1,
                    0,
                    -1,
                    0,
                    0,
                    1,
                    0,
                    0,
                    -1,
                    0,
                    1,
                    0,
                    0,
                    0,
                    1,
                    0,
                  ]));
                }),
                styledIconButton(Colors.transparent, Colors.white,
                    FontAwesomeIcons.font, 12.0, 0, () {}),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: styledIconButton(Colors.transparent, Colors.white,
                      FontAwesomeIcons.font, 14.0, 0, () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.5),
                  child: styledIconButton(Colors.transparent, Colors.white,
                      FontAwesomeIcons.font, 16.8, 0, () {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.5),
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    color: const Color(0xff0071d1),
                    child: DropdownButton(
                        underline: const Placeholder(
                          color: Colors.transparent,
                        ),
                        iconSize: 12,
                        iconEnabledColor: Colors.white,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12.75),
                        items: const [DropdownMenuItem(child: Text("English"))],
                        onChanged: (val) {}),
                  ),
                )
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 0, 100, 182),
          )
        : AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 100, 182),
            flexibleSpace: Column(
              children: [
                Row(children: [
                  styledTextButton(
                      "Events", FontAwesomeIcons.calendarDays, isNarrowScreen,
                      () async {
                    await launchUrl(
                        Uri.parse("https://ktu.edu.in/Menu/events"));
                  }),
                  styledTextButton("Announcements", FontAwesomeIcons.bullhorn,
                      isNarrowScreen, () async {
                    await launchUrl(
                        Uri.parse("https://ktu.edu.in/Menu/announcements"));
                  }),
                  styledTextButton(
                      "Gallery", FontAwesomeIcons.solidImage, isNarrowScreen,
                      () async {
                    await launchUrl(
                        Uri.parse("https://ktu.edu.in/Menu/gallery"));
                  }),
                  styledTextButton(
                      "Contact us", FontAwesomeIcons.globe, isNarrowScreen,
                      () async {
                    await launchUrl(
                        Uri.parse("https://ktu.edu.in/Menu/contactus"));
                  }),
                  styledTextButton(
                      "Tenders", FontAwesomeIcons.gavel, isNarrowScreen,
                      () async {
                    await launchUrl(
                        Uri.parse("https://ktu.edu.in/Menu/tenders"));
                  }),
                ]),
                Row(
                  children: [
                    TextButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse("https://etis-2025.org/"));
                        },
                        child: const Text("ETIS",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                    styledIconButton(Colors.white, Colors.black,
                        FontAwesomeIcons.droplet, 13.75, 5.5, () {
                      widget.filter(const ColorFilter.matrix([
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
                      ]));
                    }),
                    styledIconButton(const Color(0xff989a9e), Colors.white,
                        FontAwesomeIcons.droplet, 13.75, 5.5, () {
                      widget.filter(const ColorFilter.matrix([
                        0.33,
                        0.33,
                        0.33,
                        0,
                        0,
                        0.33,
                        0.33,
                        0.33,
                        0,
                        0,
                        0.33,
                        0.33,
                        0.33,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ]));
                    }),
                    styledIconButton(const Color(0xff1d2733), Colors.white,
                        FontAwesomeIcons.droplet, 13.75, 5.5, () {
                      widget.filter(const ColorFilter.matrix([
                        -1,
                        0,
                        0,
                        0,
                        255,
                        0,
                        -1,
                        0,
                        0,
                        255,
                        0,
                        0,
                        -1,
                        0,
                        255,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ]));
                    }),
                    styledIconButton(Colors.transparent, Colors.white,
                        FontAwesomeIcons.font, 12.0, 0, () {}),
                    styledIconButton(Colors.transparent, Colors.white,
                        FontAwesomeIcons.font, 14.0, 0, () {}),
                    styledIconButton(Colors.transparent, Colors.white,
                        FontAwesomeIcons.font, 16.8, 0, () {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.5),
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth * 0.15,
                        color: const Color(0xff0071d1),
                        child: DropdownButton(
                            underline: const Placeholder(
                              color: Colors.transparent,
                            ),
                            iconSize: 12,
                            iconEnabledColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.75,
                            ),
                            items: const [
                              DropdownMenuItem(child: Text("English"))
                            ],
                            onChanged: (val) {}),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }

  Widget styledTextButton(String text, IconData iconData, bool isNarrowScreen,
      VoidCallback onPressed) {
    return TextButton.icon(
        style: TextButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: 19.9, horizontal: 12.0),
            shape: const BeveledRectangleBorder(),
            backgroundColor: hover[text] ?? false
                ? const Color.fromARGB(255, 157, 1, 92)
                : Colors.transparent),
        onPressed: onPressed,
        label: isNarrowScreen
            ? const Text("")
            : Text(text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
        icon: Icon(
          iconData,
          color: Colors.white,
          size: 13.75,
        ),
        onHover: (val) {
          setState(() {
            hover[text] = val;
          });
        });
  }

  Widget styledIconButton(Color back, Color front, IconData icon, double size,
      double pad, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pad),
      child: SizedBox(
        height: 30,
        width: 30,
        child: IconButton(
            style: IconButton.styleFrom(
              iconSize: size,
              backgroundColor: back,
              foregroundColor: front,
            ),
            onPressed: onPressed,
            icon: FaIcon(
              icon,
            )),
      ),
    );
  }
}
