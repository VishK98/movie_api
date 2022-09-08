import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:favorite_button/favorite_button.dart';


class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

   Description({ required this.name,
        required this.description,
        required this.bannerurl,
        required this.posterurl,
        required this.vote,
        required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
            height: 250,
            child: Stack(
                children: [
              Positioned(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),])),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            modified_text(text: ' ⭐  Average Rating - ' + vote, color: Colors.white, size: 25,),
          FavoriteButton(
            isFavorite: true,
            valueChanged: (_isFavorite) {
              print('Is Favorite : $_isFavorite');
            },
          )
          ],
        ),
        Container(
            padding: const EdgeInsets.all(10),
            child: modified_text(
                text: name != null ? name : 'Not Loaded', size: 25, color: Colors.white,)),
        Container(
            padding: const EdgeInsets.only(left: 10),
            child:
            modified_text(text: 'Releasing On - ' + launch_on, size: 19, color: Colors.white,)
        ),
        const SizedBox(height: 5,),
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 120,
              child: Image.network(posterurl),
            ),
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: modified_text(text: description, size: 18, color: Colors.white,)),
            ),
          ],
        )
      ]),
    );
  }
}