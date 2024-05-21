import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15),
          child:  Text(
            "Categories",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(24),
        for (int i = 0; i < imageName.length; i = i + 2)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 187,
                    height: 141,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(254, 237, 187, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imageUrl[i],
                          width: double.infinity,
                          height: 102,
                          fit: BoxFit.cover,
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            const Gap(10),
                            Text(
                              imageName[i],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 187,
                    height: 141,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(254, 237, 187, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imageUrl[i + 1],
                          width: double.infinity,
                          height: 102,
                          fit: BoxFit.cover,
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            const Gap(10),
                            Text(
                              imageName[i + 1],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(30),
            ],
          ),
      ],
    );
  }
}
