import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/constants.dart';
import '../../data/notifieres.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
      body: SingleChildScrollView(),
    );
  }
}
