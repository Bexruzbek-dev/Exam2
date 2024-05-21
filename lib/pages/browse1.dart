import 'package:exam_2_flutter/pages/account.dart';
import 'package:exam_2_flutter/pages/homepage.dart';
import 'package:exam_2_flutter/widgets/browse_categories_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Browse1 extends StatefulWidget {
  const Browse1({super.key});

  @override
  State<Browse1> createState() => _Browse1State();
}

class _Browse1State extends State<Browse1> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = 1;
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
            const Gap(20),
            Center(
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
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search categories, podcast, etc",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
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
            CategoriesScreen(),
            const Gap(34),
            Gap(5),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(251, 188, 5, 1),
        currentIndex: 1,
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
