import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/themes/colors.dart';
import '../calls_page.dart';
import '../chats_page.dart';
import '../status_page.dart';
import 'appbar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const ChatsPage(),
    const StatusPage(),
    const CallsPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: ColorApp.primaryColor,
        onTap: onTap,
        currentIndex: currentIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: ColorApp.primaryColor,
            ),
            label: 'Chats',
            tooltip: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tips_and_updates_rounded,
              color: ColorApp.primaryColor,
            ),
            label: 'Status',
            tooltip: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: ColorApp.primaryColor,
            ),
            label: 'Calls',
            tooltip: 'Calls',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
