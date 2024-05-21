import 'package:exam_2_flutter/pages/selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NowPlaying extends StatefulWidget {
  String url;
  String name;
  String writer;

  NowPlaying(
      {super.key, required this.url, required this.name, required this.writer});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  Color like = Colors.white;
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 375,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(65),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.url),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    left: 15,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 70,
                    left: 140,
                    child: Text(
                      "Now Playing",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 65,
                    right: 15,
                    child: IconButton(
                      onPressed: () {
                        if (isLike) {
                          like = Colors.red;
                        } else {
                          like = Colors.white;
                        }
                        isLike = !isLike;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 32,
                        color: like,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(34),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.name,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      modal(context);
                    },
                    icon: Icon(
                      Icons.share,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Gap(8),
            const Text(
              "Ps. Nathaniel Kaks",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Gap(45),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 23,
              ),
              child: Row(
                children: [
                  const Text(
                    "04:30",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: 211,
                    height: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 40,
                      height: 8,
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "45:30",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(57),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    CupertinoIcons.shuffle,
                    size: 28,
                  ),
                  Image.asset(
                    "assets/play_buttons/back.png",
                    height: 48,
                  ),
                  const Icon(
                    Icons.pause_circle_sharp,
                    size: 80,
                  ),
                  Image.asset(
                    "assets/play_buttons/next.png",
                    height: 48,
                  ),
                  Image.asset(
                    "assets/play_buttons/screen.png",
                    height: 28,
                  ),
                ],
              ),
            ),
            const Gap(34),
            const Text(
              "Comments (25)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(24),
            TextField(
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(217, 217, 217, 1),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Image(
                      image: AssetImage("assets/profile_image/logo.png"),
                    ),
                  ),
                ),
                hintText: "Add your Comments",
              ),
              onChanged: (value) {},
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
