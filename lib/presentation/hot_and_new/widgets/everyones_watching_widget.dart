import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../home/screen_home.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text('Star Wars', style: kTextBold20),
        kHeight,
        const Text(
          'Star Wars is an American epic space-opera multimedia franchise created by George Lucas, which began with the eponymous 1977 film and quickly became a worldwide pop-culture phenomenon.',
          style: kGreyText,
        ),
        kHeight20,
        Image.network(landscapeImage2),
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
        )
      ],
    );
  }
}
