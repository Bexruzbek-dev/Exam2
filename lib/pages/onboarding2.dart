import 'package:exam_2_flutter/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  List<bool> isSelected = List<bool>.filled(6, false);
  List<String> imageUrl = [
    "assets/onboarding2_images/history.png",
    "assets/onboarding2_images/christian.png",
    "assets/onboarding2_images/travel.png",
    "assets/onboarding2_images/arts.png",
    "assets/onboarding2_images/culture.png",
    "assets/onboarding2_images/sports.png",
  ];
  List<String> imageName = [
    "History",
    "Christian",
    "Travel",
    "Arts",
    "Culture",
    "Sports"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 244, 213, 1.0),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Gap(70),
                  Text(
                    "Choose your interests",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Select at least 3 or more topics of interest",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(30),
                  Wrap(
                    spacing: 20,
                    children: [
                      for (var i = 0; i < imageUrl.length; i++)
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected[i] = !isSelected[i];
                                  });
                                },
                                child: Container(
                                    width: 167,
                                    height: 119,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          imageUrl[i],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: isSelected[i]
                                              ? SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child: Image.asset(
                                                      "assets/onboarding2_images/selected.png"),
                                                )
                                              : Container(),
                                        ),
                                      ],
                                    ))),
                            const Gap(5),
                            Text(
                              imageName[i],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const Gap(10),
                          ],
                        ),
                    ],
                  ),
                  Gap(30),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) {
                              return const Signup();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 350,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          color: const Color.fromRGBO(242, 154, 46, 1),
                        ),
                        child: const Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(15),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) {
                              return const Signup();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 350,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          border: Border.all(
                            color: const Color.fromRGBO(242, 154, 46, 1),
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(242, 154, 46, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ],
        ));
  }
}
