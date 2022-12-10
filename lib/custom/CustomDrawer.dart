import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
                title: const Text("Page 1"),
                onTap:  () { Navigator.of(context).pushNamed('/page1'); }
            ),
            ListTile(
                title: const Text("Page 2"),
                onTap:  () { Navigator.of(context).pushNamed('/page2'); }
            ),
          ],
        ),
    );
  }
}
