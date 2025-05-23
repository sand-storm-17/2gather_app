import 'package:flutter/material.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isHidden = false;
  bool isShared = false;
  bool isNotified = false;
  bool isMessageNotified = false;
  bool isLocationShared = false;
  String? languageDropdownValue = "English";
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            SizedBox(height: 40),
            Text(
              "Settings",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Privacy controls",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Profile Visibility"),
                              Text(
                                "Make your profile visible to others",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: isHidden,
                            activeColor: Colors.white,
                            activeTrackColor: Color.fromRGBO(255, 4, 72, 1),
                            onChanged: (value) {
                              setState(() {
                                isHidden = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Data Sharing"),
                              Text(
                                "Allow data sharing with partners",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: isShared,
                            activeColor: Colors.white,
                            activeTrackColor: Color.fromRGBO(255, 4, 72, 1),
                            onChanged: (value) {
                              setState(() {
                                isShared = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Event alerts"),
                              Text(
                                "Get Notified about new events",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: isNotified,
                            activeColor: Colors.white,
                            activeTrackColor: Color.fromRGBO(255, 4, 72, 1),
                            onChanged: (value) {
                              setState(() {
                                isNotified = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Message Notifications"),
                              Text(
                                "Enable sound and vibrations",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: isMessageNotified,
                            activeColor: Colors.white,
                            activeTrackColor: Color.fromRGBO(255, 4, 72, 1),
                            onChanged: (value) {
                              setState(() {
                                isMessageNotified = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Location services",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Location Tracking"),
                              Text(
                                "Allow apps to access your location",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: isLocationShared,
                            activeColor: Colors.white,
                            activeTrackColor: Color.fromRGBO(255, 4, 72, 1),
                            onChanged: (value) {
                              setState(() {
                                isLocationShared = value;
                              });
                            },
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Clear Location History'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Additional settings",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Language"),
                              DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    value: "English",
                                    child: Text("English"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Hindi",
                                    child: Text("Hindi"),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    languageDropdownValue = value;
                                  });
                                },
                                value: languageDropdownValue,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dark mode"),
                              Text(
                                "Changes theme to dark",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: isDark,
                            activeColor: Colors.white,
                            activeTrackColor: Color.fromRGBO(255, 4, 72, 1),
                            onChanged: (value) {
                              setState(() {
                                isDark = value;
                              });
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(onPressed: ()=> context.go(Routes.signIn), child: Text("Clean Activity History"))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
