import 'package:flutter/material.dart';

import '../../../API/apis.dart';
import '../../../API/tmdb_links.dart';
import '../../../core/constants.dart';
import '../../home/screen_home.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<dynamic> snapshotList = [];

    return FutureBuilder(
        future: HttpServices().getUpcoming(TMDB.upComing),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            snapshotList = snapshot.data;
          }
          return tryOne(snapshot, size, snapshotList, index);
        });
  }
}

Widget tryOne(snapshot, size, snapshotList, index) {
  if (snapshot.hasData) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 50,
            child: Text(
              'FEB\n\t\t11',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 435,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(TMDB.imageId + snapshotList[index].banner),
                          fit: BoxFit.cover)),
                  //  child: NetworkImage('${snapshotList[index].image}',),
                ),
                kHeight,
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        '${snapshotList[index].title}',
                        style: kTextBold40,
                        //maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        //textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CustomButton(
                                icon: Icons.alarm,
                                text: 'Remind Me',
                                iconSize: 20,
                                textSize: 10),
                            kWidth,
                            CustomButton(
                                icon: Icons.info_outline,
                                text: 'Info',
                                iconSize: 20,
                                textSize: 10),
                            kWidth
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Text('Coming on Friday'),
                kHeight,
                Text('${snapshotList[index].title}', style: kTextBold20),
                kHeight,
                Text(
                  '${snapshotList[index].overview}',
                  style: kGreyText,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } else {
    return const SizedBox();
  }
}
