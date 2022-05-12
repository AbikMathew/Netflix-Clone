import 'package:flutter/material.dart';

import '../../../API/apis.dart';
import '../../../API/tmdb_links.dart';
import '../../../core/constants.dart';
import '../../home/screen_home.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpServices().getUpcoming(TMDB.upComing),
      builder: ((context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> snapshotData = snapshot.data;

          return Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight,
                Text('${snapshotData[index + 7].title}', style: kTextBold40),
                kHeight,
                Text('${snapshotData[index + 7].overview}', style: kGreyText),
                kHeight20,
                Image.network((TMDB.imageId + snapshotData[index + 7].banner)),
                kHeight,
                Row(
                  children: const [
                    Spacer(),
                    CustomButton(
                      icon: Icons.ios_share,
                      text: 'Share',
                      iconSize: 25,
                      textSize: 12,
                    ),
                    kWidth,
                    CustomButton(
                      icon: Icons.add,
                      text: 'My List',
                      iconSize: 25,
                      textSize: 12,
                    ),
                    kWidth,
                    CustomButton(
                      icon: Icons.play_arrow,
                      text: 'Play',
                      iconSize: 25,
                      textSize: 12,
                    ),
                    kWidth
                  ],
                ), kHeight
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
