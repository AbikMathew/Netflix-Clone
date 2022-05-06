import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/top_10_card.dart';
import '../widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final movieSectionList = [
    Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(verticalImage1))),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _CustomButton(
                icon: Icons.add,
                text: 'My List',
              ),
              _PlayButton(),
              _CustomButton(
                icon: Icons.info_outline,
                text: 'Info',
              )
            ],
          ),
        )
      ],
    ),
    const MainTitleCard(title: 'Released in the past years'),
    const MainTitleCard(title: 'Trending now'),
    const Top10Card(title: 'Top 10 TV shows in India'),
    const MainTitleCard(title: 'Tense Drama'),
    const MainTitleCard(title: 'South Indian Cinema'),
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

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        Text(text, style: kText20w),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhite)),
        onPressed: () {},
        icon: const Icon(Icons.play_arrow, size: 30, color: kBlack),
        label: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text('Play', style: kText25b),
        ));
  }
}
