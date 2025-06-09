import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_flutter/data/constants.dart';
import 'package:to_do_list_flutter/data/notifieres.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              isDarkModeNotifer.value = !isDarkModeNotifer.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

              await prefs.setBool(
                KConstants.themeModeKey,
                isDarkModeNotifer.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifer,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifer, 
        builder: (context, value, child) {
          return pages
        },
      ),
    );
  }
}
