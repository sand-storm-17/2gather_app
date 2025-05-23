import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';

class PersonalChatPage extends StatelessWidget {
  final String userId;
  const PersonalChatPage({super.key, required this.userId});
  @override
  Widget build(BuildContext context) {
    final String myId = 'Sandeep';
    final screenWidth = MediaQuery.of(context).size.width;
    final _messageController = TextEditingController();
    List<Map<String, String>> chatHistory = [
      {'message': 'Hey! Excited for the event tomorrow?', 'id': '123'},
      {
        'message': 'Yes! Looking forward to it. What time are you reaching?',
        'id': 'Sandeep',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 20,
          children: [
            Image.asset(Assets.profile, width: 40),
            Column(
              children: [
                Text("$userId", style: AppTheme.bodyLarge16),
                Text(
                  "Online",
                  style: AppTheme.bodySmall10.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [Icon(Icons.call, color: Colors.red), Icon(Icons.more_vert)],
        backgroundColor: AppColors.grayShade,
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          spacing: 20,
          children:
              chatHistory
                  .map(
                    (item) => Align(
                      alignment:
                          item['id'] == userId
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 2 * screenWidth / 3,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                item['id'] == userId
                                    ? AppColors.primary
                                    : AppColors.grayShade,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft:
                                  item['id'] == userId
                                      ? Radius.circular(0)
                                      : Radius.circular(20),
                              bottomRight:
                                  item['id'] == userId
                                      ? Radius.circular(20)
                                      : Radius.circular(0),
                            ),
                          ),
                          child: Text(item['message'] ?? ''),
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.grayShade,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: AppColors.primary,
                    child: Icon(Icons.emoji_emotions),
                  ),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.send, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
