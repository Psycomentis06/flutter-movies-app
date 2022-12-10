import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            child: InkWell(
              child: Column(
                children: const [
                  Icon(
                    Icons.movie_creation_outlined,
                    size: 28,
                  ),
                  Text('All')
                ],
              ),
            )
        ),
        Container(
            child: Column(
              children: const [
                Icon(
                  Icons.search,
                  size: 28,
                ),
                Text('Search')
              ],
            )
        ),
        Container(
            child: Column(
              children: const [
                Icon(
                  Icons.category,
                  size: 28,
                ),
                Text('Categories')
              ],
            )
        ),
        Container(
            child: Column(
              children: const [
                Icon(
                  Icons.favorite,
                  size: 28,
                ),
                Text('Favorite')
              ],
            )
        ),
        InkWell(
          onTap: () => {
            Navigator.of(context).pushNamed('/add_movie')
          },
            child: Column(
              children: const [
                Icon(
                  Icons.add,
                  size: 32,
                ),
                Text('Add Movie')
              ],
            )
        ),
      ],
    );
  }
}
