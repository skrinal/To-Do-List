import 'package:flutter/material.dart';

import '../../state/notifieres.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifer,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          height: 50,
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          selectedIndex: selectedPage,
          overlayColor: WidgetStateColor.transparent,
          onDestinationSelected: (int value) {
            selectedPageNotifer.value = value;
          },
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.task,
                size: 30.0,
                color: selectedPage == 0 ? Colors.white : Colors.grey,
              ),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.add_circle_outline,
                size: 35.0,
                color: selectedPage == 1 ? Colors.white : Colors.grey,
              ),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
                size: 30.0,
                color: selectedPage == 2 ? Colors.white : Colors.grey,
              ),
              label: "",
            ),
          ],
        );
      },
    );
  }
}
