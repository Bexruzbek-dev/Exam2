import 'package:exam_2_flutter/models/userdata.dart';
import 'package:exam_2_flutter/pages/homepage.dart';
import 'package:exam_2_flutter/pages/signup.dart';
import 'package:exam_2_flutter/widgets/signupbodies.dart';

import 'package:exam_2_flutter/widgets/signupways.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map<String, dynamic>? user;

  void onTap() async {
    user = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return const Signup();
        },
      ),
    );
    print(user);
    if (user != null) {
      setState(() {});
    }
  }

  void login() {
    // ma'lumotlarni olamiz va tekshiramiz
    validateName();
    validatePassword();

    if (nameError == null && passwordError == null) {
      if (userInfo.isEmpty) {
        nameError = "Foydalanuvchi topilmadi, iltimos ro'yxatdan o'ting";
        setState(() {});
      } else {
        if (userInfo[0].name == nameController.text &&
            userInfo[0].password == passwordController.text) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) {
                return const HomePage();
              },
            ),
          );
        } else {
  

          nameError = "Ism  yoki parol xato";
          setState(() {});
        }
      }
    }
  }

  String? passwordError;
  final passwordController = TextEditingController();

  void validatePassword() {
    String password = passwordController.text;

    setState(() {
      if (password.isEmpty) {
        passwordError = "Iltimos parol kiriting";
      } else {
        passwordError = null;
      }
    });
  }

  String? nameError;
  final nameController = TextEditingController();

  validateName() {
    String name = nameController.text;

    setState(() {
      if (name.isEmpty) {
        nameError = "Iltimos ism kiriting";
      } else {
        nameError = null;
      }
    });
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
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Gap(20),
              const Center(
                child: Text(
                  "Login with your details",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const Gap(34),
              TextField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(217, 217, 217, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(
                    CupertinoIcons.person,
                    color: Colors.black,
                  ),
                  hintText: "Enter your username",
                  errorText: nameError,
                ),
                onChanged: (value) {
                  validateName();
                },
              ),
              const Gap(16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(217, 217, 217, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(
                    CupertinoIcons.lock_fill,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.eye_slash,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Enter your Password",
                  errorText: passwordError,
                ),
                onChanged: (value) {
                  validatePassword();
                },
              ),
              Gap(24),
              Center(
                child: InkWell(
                  onTap: () {
                    login();
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
                        "Login",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(24),
              const SignUpBody(
                text: "Don’t have an account?",
                textButton: "Create Account",
                choise: "or Login with",
                onpressed: HomePage(),
                onTap: Signup(),
              ),
              const Gap(24),
              const Signupways(),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
