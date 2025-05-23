import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:gather/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});
  @override
  State<Explore> createState() => _HomeState();
}

class _HomeState extends State<Explore> {
  final double minWidth = 500;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: max(screenWidth, minWidth)),
            child: Column(
              spacing: 20.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Explore", style: AppTheme.headLineLarge32),
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
                    border: Border.all(width: 2.0),
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
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/map.png")),
                    border: Border.all(width: 3.0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: screenWidth,
                  height: 200,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Discover Activities",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Column(
                  spacing: 16.0,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: screenWidth / 3,
                          height: 150,
                          child: Image.asset(Assets.act1,fit: BoxFit.fill,),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: screenWidth / 3,
                          height: 150,
                          child: Image.asset(Assets.act2, fit: BoxFit.fill),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: screenWidth / 3,
                          height: 150,
                          child: Image.asset(Assets.act3, fit: BoxFit.fill),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: screenWidth / 3,
                          height: 150,
                          child: Image.asset(Assets.act4, fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
