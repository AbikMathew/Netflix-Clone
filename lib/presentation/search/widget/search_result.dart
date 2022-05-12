import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';

import '../../../API/apis.dart';
import '../../../API/tmdb_links.dart';

const imageUrl = 'https://www.wellgousa.com/sites/default/files/styles/key_art_poster/public/2019-05/812x1200.jpg?itok=P8Q567bg';
    

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpServices().getTrending(TMDB.trending),
      builder: (context, AsyncSnapshot snapshot) {

        if (snapshot.hasData) {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTextTitle(title: 'Movies & Tv'),
            kHeight,
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                childAspectRatio: 1 / 1.4,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(19, (index) {
                  return MainCard(snapshot: snapshot, index: index);
                }),
              ),
            ),
          ],
        );
        } else {
          return const SizedBox();
        }
        
      }
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.snapshot, required this.index}) : super(key: key);

  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(TMDB.imageId + snapshot.data[index].image),
        ),
      ),
    );
  }
}
