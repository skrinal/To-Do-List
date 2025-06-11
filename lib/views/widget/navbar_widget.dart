import 'package:flutter/material.dart';

import '../../data/notifieres.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifer,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home)),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifer.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
