import 'package:flutter/material.dart';

class SettingsPageButton extends StatelessWidget {
  const SettingsPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      IconButton(
        onPressed: () {
          // toggleColor();
          Navigator.of(context).pushNamed('/settings');
        },
        icon: const Icon(Icons.settings_rounded),
      );
  }
}
