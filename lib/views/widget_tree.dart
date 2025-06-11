import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/data/notifieres.dart';
import 'package:to_do_list_flutter/views/widget/navbar_widget.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';


List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifer,
      builder: (context, value, child) {
        return Scaffold(
          body: pages.elementAt(value),
          bottomNavigationBar: NavbarWidget(),
        );
      },
    );
  }
}
