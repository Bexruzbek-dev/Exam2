import 'package:exam_2_flutter/pages/homepage.dart';
import 'package:exam_2_flutter/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final numController1 = TextEditingController();
  final numController2 = TextEditingController();
  final numController3 = TextEditingController();
  final numController4 = TextEditingController();
  String? num1Error;
  String? num2Error;
  String? num3Error;
  String? num4Error;

  void login() {
    // ma'lumotlarni olamiz va tekshiramiz

    validateNumber1();
    validateNumber2();
    validateNumber3();
    validateNumber4();

    if (num1Error == null &&
        num2Error == null &&
        num3Error == null &&
        num4Error == null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) {
            return const Login();
          },
        ),
      );
    }
  }

  void validateNumber1() {
    String num1 = numController1.text;

    setState(
      () {
        if (num1.isEmpty) {
          num1Error = "";
        } else {
          num1Error = null;
        }
      },
    );
  }

  void validateNumber2() {
    String num2 = numController2.text;

    setState(
      () {
        if (num2.isEmpty) {
          num2Error = "";
        } else {
          num2Error = null;
        }
      },
    );
  }

  void validateNumber3() {
    String num3 = numController3.text;

    setState(
      () {
        if (num3.isEmpty) {
          num3Error = "";
        } else {
          num3Error = null;
        }
      },
    );
  }

  void validateNumber4() {
    String num4 = numController4.text;

    setState(
      () {
        if (num4.isEmpty) {
          num4Error = "";
        } else {
          num4Error = null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(50),
              const Center(
                child: Text(
                  "Please check your email!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Gap(24),
              const Text(
                "    We have emailed you a 4 digit confirmation",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                "code. Please enter the code in the box below",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                " to verify your email",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Gap(34),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      controller: numController1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: "",
                        fillColor: const Color.fromRGBO(242, 154, 46, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: num1Error,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      controller: numController2,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: "",
                        fillColor: const Color.fromRGBO(242, 154, 46, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: num2Error,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      controller: numController3,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: "",
                        fillColor: const Color.fromRGBO(242, 154, 46, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: num3Error,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      controller: numController4,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: "",
                        fillColor: const Color.fromRGBO(242, 154, 46, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: num4Error,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Gap(34),
              InkWell(
                onTap: () {
                  login();
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
                      "Verify",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have the code?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend code",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(242, 154, 46, 1)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
