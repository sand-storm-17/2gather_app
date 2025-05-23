import 'package:flutter/material.dart';
import 'package:gather/routing/models/destination.dart';
import 'package:go_router/go_router.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        showSelectedLabels: false, // Hides selected labels
        showUnselectedLabels: false, // Hides unselected labels
        items: destinations.map((destination) => BottomNavigationBarItem(
          icon: Image.asset(
            destination.imagePath,
            width: 28,
            height: 28,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red); // Error fallback
            },
          ),
          label: '', // Required but hidden by showSelectedLabels
        )).toList(),
      ),
    );
  }
}
