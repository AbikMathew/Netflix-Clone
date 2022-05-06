import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/main_title.dart';

import '../widgets/main_card.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final movieSectionList = [
    MainTitleCard(
      title: 'Released in the past years',
    ),
    MainTitleCard(title: 'Trending now'),
    MainTitleCard(title: 'Tense Drama'),
    MainTitleCard(title: 'South Indian Cinema'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movieSectionList.length,
        itemBuilder: ((context, index) {
          return movieSectionList[index];
        }));
  }
}
