import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpBody extends StatefulWidget {
  final String text;
  final String textButton;
  final String choise;
  final Widget onpressed;
  final Widget onTap;

  const SignUpBody({
    super.key,
    required this.text,
    required this.textButton,
    required this.choise,
    required this.onpressed,
    required this.onTap,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(34),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Gap(8),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) {
                    return widget.onTap;
                  },
                ));
              },
              child: Text(
                widget.textButton,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(242, 154, 46, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 2,
                color: Colors.grey,
              ),
            ),
            const Gap(9),
            Text(
              widget.choise,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Gap(9),
            Expanded(
              child: Container(
                height: 2,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
