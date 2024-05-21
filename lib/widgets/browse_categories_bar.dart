import 'package:exam_2_flutter/widgets/browse2_podcasts.dart';
import 'package:exam_2_flutter/widgets/browse_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 0;
  bool isVisiblePodcast = false;
  bool isVisibleCategory = true;

  final List<Map<String, dynamic>> _categories = [
    {
      'icon': Icons.grid_view,
      'label': 'Categories',
    },
    {
      'icon': CupertinoIcons.chat_bubble_text,
      'label': 'Topics',
    },
    {
      'icon': Icons.people,
      'label': 'Authors',
    },
    {
      'icon': Icons.podcasts,
      'label': 'Podcast',
    },
    {
      'icon': Icons.music_note,
      'label': 'Episodes',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        isVisiblePodcast = false;
        isVisibleCategory = true;
      } else if (index == 3) {
        isVisibleCategory = false;
        isVisiblePodcast = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.asMap().entries.map((entry) {
                int idx = entry.key;
                Map<String, dynamic> category = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () => _onItemTapped(
                      idx,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: _selectedIndex == idx
                              ? Color.fromRGBO(251, 188, 5, 1)
                              : Color.fromRGBO(255, 244, 213, 1.0),
                          child: Icon(
                            category['icon'],
                            color: _selectedIndex == idx
                                ? Colors.white
                                : Colors.black,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category['label'],
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedIndex == idx
                                ? Color.fromRGBO(251, 188, 5, 1)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        if (isVisibleCategory) const Categories(),
        if (isVisiblePodcast) const Podcast(),
      ],
    );
  }
}
