import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';

class Event extends StatelessWidget {
  final List<Map<String, String>> data;
  const Event({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children:
          data.map((item) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(blurRadius: 2)],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset(Assets.friends, height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['creator'] ?? '', style: AppTheme.bodyMedium14),
                          Text(item['createdAt'] ?? '', style: AppTheme.bodySmall8),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['title'] ?? '',
                      style: AppTheme.bodyLarge16,
                    ),
                  ),
                  Text(
                    item['description'] ?? '',
                    style: AppTheme.bodySmall8,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.access_time, size: 14),
                          Text(
                            item['eventTime'] ?? '',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.hinttextcolor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(Icons.group, size: 14),
                          Text(
                            item['groupSize'] ?? '',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.hinttextcolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Join Activity",
                      style: TextStyle(color: AppColors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.secondary,
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(double.infinity, 40),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
