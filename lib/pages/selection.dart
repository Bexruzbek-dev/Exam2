import 'package:exam_2_flutter/pages/account.dart';
import 'package:exam_2_flutter/pages/browse1.dart';
import 'package:exam_2_flutter/pages/homepage.dart';
import 'package:exam_2_flutter/pages/nowplaying.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PodcastScreen extends StatefulWidget {
  String appBarText;
  String imageUrl;
  String name;

  PodcastScreen(
      {super.key,
      required this.appBarText,
      required this.imageUrl,
      required this.name});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

Future modal(BuildContext context) {
  List<String> sharingImages = [
    "assets/sharing/facebook.png",
    "assets/sharing/instagram.png",
    "assets/sharing/blutoeth.png",
    "assets/sharing/telegram.png",
    "assets/sharing/gmail.png",
    "assets/sharing/messanger.png",
    "assets/sharing/drive.png",
    "assets/sharing/whatsapp.png",
  ];

  List<String> sharingNames = [
    "Facebook",
    "Instagram",
    "Bluetooth",
    "Telegram",
    "Gmail",
    "Messanger",
    "Drive",
    "Whatsapp",
  ];

  Future modal = showModalBottomSheet(
    backgroundColor: Colors.grey.shade200,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 378,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(65),
            topRight: Radius.circular(65),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 124,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black,
              ),
            ),
            Gap(54),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(25),
                for (int i = 0; i < sharingImages.length - 4; i++)
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 69,
                            height: 69,
                            color: Colors.white,
                            child: Center(
                              child: Image.asset(
                                sharingImages[i],
                                height: 34,
                              ),
                            ),
                          ),
                          const Gap(8),
                          Text(
                            sharingNames[i],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const Gap(24),
                    ],
                  )
              ],
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(25),
                for (int i = 4; i < sharingImages.length; i++)
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 69,
                            height: 69,
                            color: Colors.white,
                            child: Center(
                              child: Image.asset(
                                sharingImages[i],
                                height: 34,
                              ),
                            ),
                          ),
                          const Gap(8),
                          Text(
                            sharingNames[i],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const Gap(24),
                    ],
                  ),
              ],
            ),
            const Gap(30),
            Image.asset(
              "assets/sharing/circle.png",
              width: 55,
            ),
            const Gap(30),
          ],
        ),
      );
    },
  );
  return modal;
}

class _PodcastScreenState extends State<PodcastScreen> {
  final List<Map<String, String>> episodes = [
    {
      'title': 'The Bible',
      'subtitle': 'Episode 1',
      'image': 'assets/episode_images/book.png',
    },
    {
      'title': 'The Christian',
      'subtitle': 'Episode 2',
      'image': 'assets/episode_images/xoch.png',
    },
    {
      'title': 'The Christian Ethics',
      'subtitle': 'Episode 3',
      'image': 'assets/episode_images/quote.png',
    },
    {
      'title': 'Purpose of Ethics',
      'subtitle': 'Episode 4',
      'image': 'assets/episode_images/picture.png',
    },
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) {
              return const Browse1();
            },
          ),
        );
      }
      if (index == 0) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) {
              return const HomePage();
            },
          ),
        );
      }
      if (index == 3) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) {
              return const Account();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.appBarText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return Account();
                  },
                ),
              );
            },
            child:const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image/logo.png'),
            ),
          ),
         const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 185,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(251, 188, 5, 1)),
                              child: const Icon(Icons.download,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(251, 188, 5, 1)),
                              child: const Icon(Icons.notification_add_sharp,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 70,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(251, 188, 5, 1)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "5.0",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(Icons.star, color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(251, 188, 5, 1)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Subscribe',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    '15 Episodes',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '(1hr 30 min)',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      modal(context);
                    },
                  ),
                ],
              ),
            ),
            Gap(16),
            for (int i = 0; i < episodes.length; i++)
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return NowPlaying(
                              url: episodes[i]["image"]!,
                              name: episodes[i]["title"]!,
                              writer: widget.appBarText);
                        }));
                      },
                      child: Container(
                        width: 370,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: Row(
                          children: [
                            Container(
                              width: 92,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(episodes[i]["image"]!),
                            ),
                            Gap(24),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  episodes[i]["title"]!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  episodes[i]["subtitle"]!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const Spacer(),
                            i == 0
                                ? const Icon(
                                    Icons.pause_circle_sharp,
                                    size: 34,
                                  )
                                : const Icon(
                                    Icons.download_for_offline_rounded,
                                    size: 34,
                                  ),
                            const Gap(10),
                            const Icon(
                              Icons.more_vert,
                              size: 34,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(14),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(251, 188, 5, 1),
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color.fromARGB(144, 245, 245, 245),
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (value) {
          _onItemTapped(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home,
                color: Color.fromARGB(144, 245, 245, 245)),
            activeIcon: Icon(CupertinoIcons.home, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search,
                color: Color.fromARGB(144, 245, 245, 245)),
            activeIcon: Icon(CupertinoIcons.search, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.favorite, color: Color.fromARGB(144, 245, 245, 245)),
            activeIcon: Icon(Icons.favorite, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled,
                color: Color.fromARGB(144, 245, 245, 245)),
            activeIcon:
                Icon(CupertinoIcons.profile_circled, color: Colors.white),
            label: "",
          ),
        ],
      ),
    );
  }
}
