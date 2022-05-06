import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

const verticalImage =
    'https://www.wellgousa.com/sites/default/files/styles/key_art_poster/public/2019-05/812x1200.jpg?itok=P8Q567bg';


class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: kBorderRadius8,
            image: const DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(verticalImage))),
      ),
    );
  }
}
