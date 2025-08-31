import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/state/notifieres.dart';
import 'package:to_do_list_flutter/views/widget/navbar_widget.dart';
import 'pages/add_task_page.dart';
import 'pages/task_page.dart';
import 'pages/profile_page.dart';

List<Widget> pages = [TaskPage(), AddTaskPage(),ProfilePage()];

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
