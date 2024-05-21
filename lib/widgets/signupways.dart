
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Signupways extends StatelessWidget {
  const Signupways({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 375,
              height: 46,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/signup_images/google.png",
                    height: 22,
                  ),
                  Gap(16),
                  const Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(16),
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 375,
              height: 46,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/signup_images/facebook.png",
                    height: 22,
                  ),
                  Gap(16),
                  const Text(
                    "Facebook",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(16),
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 375,
              height: 46,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/signup_images/twitter.png",
                    height: 22,
                  ),
                  Gap(16),
                  const Text(
                    "Twitter",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
