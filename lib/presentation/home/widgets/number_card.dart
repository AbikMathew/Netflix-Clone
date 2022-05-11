import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/API/apis.dart';
import 'package:netflix_clone/API/tmdb_links.dart';
import '../../../core/constants.dart';
import '../../widgets/main_card.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HttpServices().getTrending(TMDB.trending),
        builder: (context, AsyncSnapshot snapshot) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Stack(
              children: [
                snapshot.hasData
                    ? Container(
                        margin: const EdgeInsets.only(left: 30),
                        height: 250,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: kBorderRadius8,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(TMDB.imageId +
                                        snapshot.data[index + 8].image)
                                    .image)),
                      )
                    : const SizedBox(
                        height: 250,
                        width: 140,
                      ),
                Positioned(
                    bottom: -32,
                    left: -6,
                    child: BorderedText(
                      strokeColor: Colors.white,
                      strokeWidth: 7.0,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: kBlack,
                          fontSize: 140,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
