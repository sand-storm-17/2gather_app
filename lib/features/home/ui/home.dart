import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/features/home/ui/event.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double minWidth = 500;
  int selectedIndex = 0;
  final List<String> labels = ['Quick Join', 'All Events'];
  List<Map<String, String>> quickJoin = [
    {
      'creator': 'Sarah Mitchell',
      'createdAt': '2 hours ago',
      'title': 'Morning Walk',
      'description': 'Morning walk at Cubon park',
      'eventTime': 'Tomorrow 8 AM',
      'groupSize': '2/5',
    },
  ];
  List<Map<String, String>> allEvents = [
    {
      'creator': 'Sarah Mitchell',
      'createdAt': '2 hours ago',
      'title': 'Morning Walk',
      'description': 'Morning walk at Cubon park',
      'eventTime': 'Tomorrow 8 AM',
      'groupSize': '2/5',
    },
    {
      'creator': 'Sandeep',
      'createdAt': '2 hours ago',
      'title': 'Morning Walk',
      'description': 'Morning walk at Cubon park',
      'eventTime': 'Tomorrow 8 AM',
      'groupSize': '2/5',
    },
    {
      'creator': 'Keshav',
      'createdAt': '2 hours ago',
      'title': 'Morning Walk',
      'description': 'Morning walk at Cubon park',
      'eventTime': 'Tomorrow 8 AM',
      'groupSize': '2/5',
    },
    {
      'creator': 'Raghu',
      'createdAt': '2 hours ago',
      'title': 'Morning Walk',
      'description': 'Morning walk at Cubon park',
      'eventTime': 'Tomorrow 8 AM',
      'groupSize': '2/5',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: max(screenWidth, minWidth)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20.0,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30),
              Container(
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hey, Das!", style: AppTheme.headLineLarge24),
                        Text(
                          "How are you feeling today?",
                          style: AppTheme.bodyMedium14,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed:
                          () => context.go(Routes.nestedNotificationsPage),
                      icon: Icon(Icons.notifications, size: 36),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: AppColors.primary),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.search, size: 36),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Nearby",
                          hintStyle: TextStyle(color: AppColors.hinttextcolor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/map.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(blurRadius: 3)],
                      ),
                      width: 3 * screenWidth / 5,
                      height: 150,
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/map.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(blurRadius: 3)],
                      ),
                      width: 3 * screenWidth / 5,
                      height: 150,
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/map.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(blurRadius: 3)],
                      ),
                      width: 3 * screenWidth / 5,
                      height: 150,
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/map.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(blurRadius: 3)],
                      ),
                      width: 3 * screenWidth / 5,
                      height: 150,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("All Category", style: AppTheme.bodyLarge16),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.group),
                          ),
                          Text(
                            "Commercial Gathering",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.group),
                          ),
                          Text(
                            "Commercial Gathering",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.group),
                          ),
                          Text(
                            "Commercial Gathering",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.group),
                          ),
                          Text(
                            "Commercial Gathering",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.group),
                          ),
                          Text(
                            "Commercial Gathering",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.group),
                          ),
                          Text(
                            "Commercial Gathering",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.group),
                          ),
                          Text(
                            "Commercial Gathering",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(labels.length, (index) {
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? Colors.pinkAccent
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              selectedIndex == 0
                  ? Event(data: quickJoin)
                  : Event(data: allEvents),
            ],
          ),
        ),
      ),
    );
  }
}
