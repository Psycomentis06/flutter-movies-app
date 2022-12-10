import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_discuss/custom/main.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieDetailsView();
}

class _MovieDetailsView extends State<MovieDetailsView> {
  dynamic movie = {};

  void getMovie(int index) async {
    String data = await rootBundle.loadString('assets/movies.json');
    List<dynamic> movies = jsonDecode(data)['results'];
    setState(() {
      movie = movies.elementAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object>? movieIndexObj =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>?;
    int? movieIndex = movieIndexObj!['movie_index'] as int?;
    String defaultImage =
        'https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png';
    if (movieIndex != null) {
      getMovie(movieIndex);
      return Scaffold(
        appBar: AppBar(title: Text(movie['Title'] ?? 'No Name')),
        body: ListView(children: [
          Column(
            children: [
              Container(
                height: 200,
                child: Image.network(movie['Poster'] ?? defaultImage),
              ),
              Image.network(
                movie['Poster'] ?? defaultImage,
                width: 200,
                height: 350,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ]),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('No movie index was given'),
        ),
      );
    }
  }
}
