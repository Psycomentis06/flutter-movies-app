import 'package:flutter/material.dart';

class AddMovieView extends StatefulWidget {
  final Function(List<dynamic> movies) setMoviesCallback;
  final List<dynamic> movies;
  const AddMovieView({Key? key, required this.setMoviesCallback, required this.movies}) : super(key: key);

  @override
  State<AddMovieView> createState() => _AddMovieViewState();
}

class _AddMovieViewState extends State<AddMovieView> {

  final _addMovieFormKey = GlobalKey<FormState>();

  addMovie(Map<String, dynamic> movie) {
    var movies = widget.movies;
    movies.add(movie);
    setState(() {
      widget.setMoviesCallback(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> movie = {};
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie'),
      ),
      body: ListView(
        children: [
          Form(
              key: _addMovieFormKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      maxLength: 10,
                      decoration: const InputDecoration(
                          hintText: 'eg.Shingeki No Kyojin',
                          label: Text('Name')
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Name is required';
                      },
                      onSaved: (val) {
                        movie['Title'] = val;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Movie plot',
                          label: Text('Description'),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Description is required';
                      },
                      maxLength: 50,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onSaved: (val) {
                        movie['Plot'] = val;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Private Code',
                        label: Text('Private Code'),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Private code is required';
                      },
                      maxLength: 14,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      maxLines: 1,
                      onSaved: (val) {
                        movie['rate'] = val;
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          if (_addMovieFormKey.currentState!.validate()) {
                            _addMovieFormKey.currentState?.save();
                            addMovie(movie);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Movie Added'))
                            );
                          }
                        },
                        child: const Text('Add Movie')
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
