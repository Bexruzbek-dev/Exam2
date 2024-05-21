import 'package:exam_2_flutter/models/userdata.dart';
import 'package:exam_2_flutter/pages/login.dart';
import 'package:exam_2_flutter/pages/verification.dart';
import 'package:exam_2_flutter/widgets/signupbodies.dart';
import 'package:exam_2_flutter/widgets/signupways.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool iVisible = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos ism kiriting";
    } else if (value.length < 4) {
      return "Iltimos uzunroq ism kiriting";
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos elektron pochta kiriting";
    } else if (!value.contains("@") ||
        !value.substring(value.indexOf("@")).contains(".")) {
      return "To'g'ri elektron pochta kiriting";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parol kiriting";
    } else if (value.length < 8) {
      return "Iltimos eng kamida 8ta element kiriting";
    }

    return null;
  }

  String? validatePasswordConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parolni tasdiqlang";
    } else if (value != passwordController.text) {
      return "Parollar mos kelmadi";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(30),
              const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Gap(20),
              const Center(
                child: Text(
                  "Create an account with us",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const Gap(34),
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_2_outlined),
                  hintText: "Enter your username",
                  labelText: "Enter your username",
                ),
                validator: validateName,
                onSaved: (newValue) {
                  if (newValue != null && newValue.isNotEmpty) {
                    name = newValue;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.envelope_fill),
                  border: OutlineInputBorder(),
                  hintText: "Enter your email adress",
                  labelText: "Enter your email adress",
                ),
                validator: validateEmail,
                onSaved: (newValue) {
                  if (newValue != null && newValue.isNotEmpty) {
                    email = newValue;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: iVisible,
                textInputAction: TextInputAction.next,
                controller: passwordController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    hintText: "Enter your Password",
                    labelText: "Enter your Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          iVisible = !iVisible;
                          setState(() {});
                        },
                        icon: const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.black,
                        ))),
                validator: validatePassword,
                onSaved: (newValue) {
                  if (newValue != null && newValue.isNotEmpty) {
                    password = newValue;
                  }
                },
              ),
              const Gap(24),
              Center(
                child: InkWell(
                  onTap: () {
                    userInfo.add(Userdata(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text));

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const Verification();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 375,
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
                        "Sign up",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SignUpBody(
                text: "Already have an account?",
                textButton: "Login",
                choise: "or Sign up with",
                onpressed: Verification(),
                onTap: Login(),
              ),
              const Gap(24),
              const Signupways(),
            ],
          ),
        ),
      ),
    );
  }
}
