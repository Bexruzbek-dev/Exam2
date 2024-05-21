import 'package:exam_2_flutter/pages/selection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Podcast extends StatefulWidget {
  const Podcast({super.key});

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  List<Map<String, String>> imageInfo = [
    {
      "url": "assets/podcasts/biblical.png",
      "name": "Biblical and Christian Ethics",
      "writer": "Ps. Nathaniel Kaks"
    },
    {
      "url": "assets/podcasts/faith.png",
      "name": "Living in Faith",
      "writer": "Ps. Mane Graham"
    },
    {
      "url": "assets/podcasts/worship.png",
      "name": "Worship and Music",
      "writer": "Bishop Lora Peters"
    },
    {
      "url": "assets/podcasts/christ.png",
      "name": "The Life of Christ",
      "writer": "Talan Arcand"
    },
    {
      "url": "assets/podcasts/times.png",
      "name": "Understanding the Times",
      "writer": "Matthew Joshua"
    },
    {
      "url": "assets/podcasts/prayer.png",
      "name": "Power of Prayer",
      "writer": "Matthew Henry"
    },
    {
      "url": "assets/podcasts/family.png",
      "name": "Marriage and Family",
      "writer": "Matthew Henry"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Gap(20),
            Text(
              "Trending Christian Podcast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Gap(14),
        for (int i = 0; i < imageInfo.length; i++)
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return PodcastScreen(
                        appBarText: imageInfo[i]["writer"]!,
                        imageUrl: imageInfo[i]["url"]!,
                        name: imageInfo[i]["name"]!);
                  }));
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(right: 9),
                    width: 370,
                    height: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(254, 237, 187, 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 58,
                          height: 63,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            imageInfo[i]["url"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Gap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              imageInfo[i]["name"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              imageInfo[i]["writer"]!,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Center(
                          child: const Icon(
                            Icons.play_circle_outline_outlined,
                            color: Color.fromRGBO(191, 104, 27, 1),
                            size: 34,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(16),
            ],
          ),
      ],
    );
  }
}
