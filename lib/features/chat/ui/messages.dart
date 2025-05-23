import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:gather/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class Messages extends StatelessWidget {
  final List<Map<String, String>> data;
  const Messages({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((item) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => context.push('/personalChat/123'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.profile, width: 40), // Adjust width as needed
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['username'] ?? '', style: AppTheme.bodyLarge16),
                    Text(item['text'] ?? '', style: AppTheme.bodySmall10),
                  ],
                ),
                Text(DateTime.now().toString()),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
