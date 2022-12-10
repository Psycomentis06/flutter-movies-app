import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  final Function(List<dynamic> movies) setMoviesCallback;
  const Home({Key? key, required this.setMoviesCallback }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  List<dynamic> movies = [];

  void getMovies() async {
    String data = await rootBundle.loadString('assets/movies.json');
    Map<String, dynamic> decoded = jsonDecode(data);
    setState(() {
      movies = decoded['results']!;
      widget.setMoviesCallback(movies);
    });
  }

  String getExcerpt(String text, {int size = 20}) {
    if (text.length > size) {
      return '${text.substring(0, size)}...';
    }
    return '$text...';
  }

  @override
  Widget build(BuildContext context) {
    String defaultImageUrl =
        'https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png';
    getMovies();
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: movies.length,
        //itemCount: movies.isNotEmpty ? 4 : 0,
        itemBuilder: (BuildContext context, int index) {
          Map item = movies.elementAt(index);
          return Align(
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/movie_details', arguments: {
                  'movie_index': index
                });
              },
              title: Align(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: .7,
                          image:
                          NetworkImage(item['Poster'] ?? defaultImageUrl),
                          fit: BoxFit.cover
                      ),
                      color: Colors.black87,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.black54,
                        child: Column(
                            children: [
                        Text(
                        item['Title'] ?? 'No title',
                        style: const TextStyle(
                        color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.fade
                        ),
                        softWrap: true,
                        textAlign: TextAlign.left,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      Text(
                        item['Plot'] != null ? getExcerpt(
                            item['Plot'], size: 50) : 'No Description',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14
                        ),
                        textAlign: TextAlign.justify,
                      )
                      ],
                    ),
                  )
              )
              ],
            ),
          )),
          )
          );
        },
      ),
    );
  }
}
