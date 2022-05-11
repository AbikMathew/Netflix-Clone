import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../../API/apis.dart';
import '../../../API/tmdb_links.dart';
import 'title.dart';

const imageUrl = 'https://mcdn.wallpapersafari.com/medium/86/57/6FxmsH.jpg';

//const imageUrl = 'https://www.themoviedb.org/t/p/w220_and_h330_face/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchItemTile(index: index),
              separatorBuilder: (ctx, index) => kHeight20,
              itemCount: 15),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key, this.index = 0}) : super(key: key);

  final index;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: HttpServices().getUpcoming(TMDB.upComing),
        builder: (context, AsyncSnapshot snapshot) {
          return Row(
            children: [
              snapshot.hasData
                  ? Container(
                      width: screenWidth * 0.3,
                      height: 65,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              TMDB.imageId + snapshot.data[index].image),
                        ),
                      ),
                    )
                  : SizedBox(width: screenWidth * 0.3, height: 65),
              kWidth,
              const Expanded(
                child: Text(
                  'Movie Names',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const Icon(
                Icons.play_circle_outline,
                size: 50,
              )
            ],
          );
        });
  }
}
