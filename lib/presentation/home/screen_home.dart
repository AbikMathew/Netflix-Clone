import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/top_10_card.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  final movieSectionList = const [
    MainTitleCard(title: 'Released in the past years'),
    MainTitleCard(title: 'Trending now'),
    Top10Card(title: 'Top 10 TV shows in India'),
    MainTitleCard(title: 'Tense Drama'),
    MainTitleCard(title: 'South Indian Cinema'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieSectionList.length,
      itemBuilder: ((context, index) {
        return movieSectionList[index];
      }),
    );
  }
}
