import 'package:flutter/material.dart';
import 'package:netflix_clone/API/apis.dart';
import 'package:netflix_clone/API/tmdb_links.dart';
import 'package:netflix_clone/core/constants.dart';

const verticalImage =
    'https://www.wellgousa.com/sites/default/files/styles/key_art_poster/public/2019-05/812x1200.jpg?itok=P8Q567bg';

class MainCard extends StatelessWidget {
  MainCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HttpServices().getTrending(TMDB.trending),
        builder: (context,AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadius8,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                                    TMDB.imageId + snapshot.data[index].image)
                                .image)),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250,
                    width: 130,
                  ));
        });
  }
}
