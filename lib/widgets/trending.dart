import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({required this.trending}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Trending Movies',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                  name: trending[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  description: trending[index]['overview'],
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launch_on: trending[index]
                                  ['release_date'],
                                )));
                      },
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            const SizedBox(height: 5),
                            modified_text(
                                size: 18,
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading', color: Colors.white,)
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}