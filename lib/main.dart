import 'package:flutter/material.dart';
import 'package:lets_discuss/views/AddMovie.dart';
import 'package:lets_discuss/views/MovieDetailsView.dart';
import 'package:lets_discuss/widgets/CustomDrawer.dart';
import 'package:lets_discuss/logic/ThemeColor.dart';
import 'package:lets_discuss/views/SettingsView.dart';
import 'package:lets_discuss/widgets/CustomFooter.dart';
import 'package:lets_discuss/widgets/SettingsPageButton.dart';
import 'Home.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {

  List<dynamic> movies = [];
  Map<String, MaterialColor> accentThemes = ThemeColor.accentThemes;

  late MaterialColor defaultColor;

  late ThemeMode themeMode;

  _AppState() {
    defaultColor = ThemeColor.getColor('pink');
    themeMode = ThemeMode.system;
  }


  void setAccentColor(MaterialColor color) {
    setState(() {
      defaultColor = color;
    });
  }

  void setAccentColorWithName(String colorName) {
    setAccentColor(ThemeColor.getColor(colorName));
  }

  void setThemeMode(int val) {
    setState(() {
      if (val == 1) {
        themeMode = ThemeMode.light;
      } else if (val == 2) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.system;
      }
    });
  }

  bool isActive(String routeName) {
    return Navigator.defaultRouteName == routeName;
  }


  void setMovies(List<dynamic> movies) {
    setState(() {
      this.movies = movies;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's Discuss",
      routes: {
        '/settings': (context) => SettingsView(
            themeColorCallback: setAccentColorWithName,
            themeModeCallback: setThemeMode,
          defaultThemeColor: defaultColor,
          defaultThemeMode: themeMode
        ),
       '/movie_details': (context) => const MovieDetailsView(),
       '/add_movie': (context) => AddMovieView(
         movies: movies,
         setMoviesCallback: setMovies,
       )
      },
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: defaultColor,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: defaultColor,
      ),
      themeMode: themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Let's Discuss"),
          centerTitle: true,
          actions: const [
            SettingsPageButton()
          ],
        ),
        drawer: const CustomDrawer(),
        body: Home(
          setMoviesCallback: setMovies,
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: const [
          CustomFooter()
        ],
      ),
    );
  }
}
