import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/features/chat/ui/messages.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int selectedIndex = 0; // Default to "Ongoing"

  final List<String> labels = ['Ongoing', 'Upcoming', 'Expired'];
  List<Map<String, String>> ongoing = [
    {"username": "ongoing1", "text": "heeleo"},
    {"username": "ongoing2", "text": "heeleo"},
    {"username": "ongoing3", "text": "heeleo"},
  ];
  List<Map<String, String>> upcoming = [
    {"username": "upcoming1", "text": "heeleo"},
    {"username": "upcoming2", "text": "heeleo"},
    {"username": "upcoming3", "text": "heeleo"},
  ];
  List<Map<String, String>> retired = [
    {"username": "retired1", "text": "heeleo"},
    {"username": "retired2", "text": "heeleo"},
    {"username": "retired3", "text": "heeleo"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 30,
          children: [
            Align(alignment: Alignment.centerLeft,child: Text("Chats", style: AppTheme.headLineLarge24)),
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
                            isSelected ? Colors.pinkAccent : Colors.transparent,
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
            selectedIndex == 1
                ? Messages(data: upcoming)
                : selectedIndex == 2
                ? Messages(data: retired)
                : Messages(data: ongoing),
          ],
        ),
      ),
    );
  }
}
