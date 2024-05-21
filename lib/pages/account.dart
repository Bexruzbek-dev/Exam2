import 'package:exam_2_flutter/pages/browse1.dart';
import 'package:exam_2_flutter/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
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

  List<Map<String, dynamic>> info = [
    {
      "icon": const Icon(
        Icons.queue_music_sharp,
        color: Colors.white,
        size: 30,
      ),
      "name": "Playlist",
    },
    {
      "icon": const Icon(
        Icons.bookmark,
        color: Colors.white,
        size: 30,
      ),
      "name": "Suscriptions",
    },
    {
      "icon": const Icon(
        Icons.bookmark,
        color: Colors.white,
        size: 30,
      ),
      "name": "Bookmark",
    },
    {
      "icon": const Icon(
        Icons.notifications,
        color: Colors.white,
        size: 30,
      ),
      "name": "Notifications",
    },
    {
      "icon": const Icon(
        Icons.notifications,
        color: Colors.white,
        size: 30,
      ),
      "name": "Reviews",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 178,
              width: 178,
              child: Image.asset(
                "assets/profile_image/logo1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(7),
          const Text(
            textAlign: TextAlign.center,
            "Akosua Champion",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(34),
          const Text(
            "19 Following        55 Podcast",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(34),
          for (int i = 0; i < info.length; i++)
            Column(
              children: [
                Container(
                  width: 350,
                  height: 59,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(191, 104, 27, 1),
                  ),
                  child: Row(
                    children: [
                      Gap(10),
                      info[i]["icon"],
                      const Gap(16),
                      Text(
                        info[i]["name"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.navigate_next_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
              ],
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(251, 188, 5, 1),
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.shade100,
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
