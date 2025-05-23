import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            SizedBox(height: 50),
            Text(
              "Notifications",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text("All", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text("Events"),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text("Messages", style: TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ),
            Text("Today"),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(241, 240, 245, 1),
              ),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 4, 72, 1),
                    ),
                    child: Icon(Icons.calendar_today, color: Colors.white),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text("New Event Invitation", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("Sarah Thompson"),
                      Row(
                        spacing: 5,
                        children: [
                          OutlinedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primary,
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: Text("Accept", style: TextStyle(color: Colors.white)),
                            ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: Text("Decline", style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text("Yesterday"),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(241, 240, 245, 1),
              ),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 4, 72, 1),
                    ),
                    child: Icon(Icons.calendar_today, color: Colors.white),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text("New Event Invitation", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("Sarah Thompson"),
                      Row(
                        spacing: 5,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: Text("Accept", style: TextStyle(color: Colors.white)),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: Text("Decline", style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text("Earlier"),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(241, 240, 245, 1),
              ),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 4, 72, 1),
                    ),
                    child: Icon(Icons.calendar_today, color: Colors.white),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text("New Event Invitation", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("Sarah Thompson"),
                      Row(
                        spacing: 5,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: Text("Accept", style: TextStyle(color: Colors.white)),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary,
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: Text("Decline", style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
