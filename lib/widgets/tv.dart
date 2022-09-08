import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  TV({required this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const modified_text(
            text: 'Popular TV Shows',
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 260,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                    name: tv[index]['title'],
                                    bannerurl:
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['backdrop_path'],
                                    posterurl:
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['poster_path'],
                                    description: tv[index]['overview'],
                                    vote: tv[index]['vote_average']
                                        .toString(),
                                    launch_on: tv[index]
                                    ['release_date'],
                                  )));
                        },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        width: 160,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path']),
                                    fit: BoxFit.cover),
                              ),
                              height: 200,
                            ),
                            const SizedBox(height: 5),
                            modified_text(
                              size: 15,
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'Loading', color: Colors.white,)
                          ],
                        ),
                      ));
                  }))
        ],
      ),
    );
  }
}