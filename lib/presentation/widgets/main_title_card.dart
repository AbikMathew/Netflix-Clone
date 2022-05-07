import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';

import '../../core/constants.dart';
import '../home/widgets/main_title.dart';


class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key, required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
         MainTitle(title: title),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(15, (index) => const MainCard()),
          ),
        )
      ],
    );
  }
} 
