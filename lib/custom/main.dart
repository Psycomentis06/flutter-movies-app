

import 'package:flutter/material.dart';
import './CardInfo.dart';
import 'CustomDrawer.dart';
import 'PageOne.dart';

main() {
 runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      routes: {
        '/page1': (context) => const PageOne(),
        '/page2': (context) => const PageOne()
      },
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Info Card"),
            centerTitle: true,
      ),
        drawer: const CustomDrawer(),
        body: const Text("Home Page"),
      )
    );
  }

}