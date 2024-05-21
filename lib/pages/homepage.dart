import 'package:exam_2_flutter/pages/account.dart';
import 'package:exam_2_flutter/pages/browse1.dart';
import 'package:exam_2_flutter/pages/selection.dart';
import 'package:exam_2_flutter/widgets/homepagewidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map info = {
    "url": "assets/podcasts/biblical.png",
    "name": "Biblical and Christian\n Ethics",
    "writer": "Ps. Nathaniel Kaks"
  };
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
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 32,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "iPodcast",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 32,
              color: Colors.black,
            ),
          ),
          const Gap(5),
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
            child: Container(
              height: 34,
              width: 34,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/profile_image/logo.png"),
            ),
          ),
          const Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: 370,
                height: 53,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search podcast",
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(251, 188, 5, 1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Featured Podcast",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const FeaturedPodcast(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(242, 154, 46, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Recommended(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Continue Listening",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View history",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(242, 154, 46, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) {
                      return PodcastScreen(
                          appBarText: info["writer"],
                          imageUrl: info["url"],
                          name: info["name"]);
                    },
                  ));
                },
                child: Container(
                  padding: EdgeInsets.only(right: 9),
                  width: 370,
                  height: 63,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(242, 154, 46, 0.12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 58,
                        height: 63,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/podcasts/biblical.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        "Biblical and Christian Ethics",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.play_circle_outline_outlined,
                        color: Color.fromRGBO(191, 104, 27, 1),
                        size: 31,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(251, 188, 5, 1),
        currentIndex: 0,
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
            icon: Icon(
              CupertinoIcons.home,
              color: Color.fromARGB(
                144,
                245,
                245,
                245,
              ),
            ),
            activeIcon: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.search,
              color: Color.fromARGB(
                144,
                245,
                245,
                245,
              ),
            ),
            activeIcon: Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Color.fromARGB(
                144,
                245,
                245,
                245,
              ),
            ),
            activeIcon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Color.fromARGB(
                144,
                245,
                245,
                245,
              ),
            ),
            activeIcon:
                Icon(CupertinoIcons.profile_circled, color: Colors.white),
            label: "",
          ),
        ],
      ),
    );
  }
}
