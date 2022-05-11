
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/API/apis.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/top_10_card.dart';
import '../../API/tmdb_links.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final movieSectionList = [
    const BackgroundCard(),
    kHeight,
    const MainTitleCard(title: 'Released in the past years'),
    const MainTitleCard(title: 'Trending now'),
    const Top10Card(title: 'Top 10 TV shows in India'),
    const MainTitleCard(title: 'Tense Drama'),
    const MainTitleCard(title: 'South Indian Cinema'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;

                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: ListView.builder(
                      itemCount: movieSectionList.length,
                      itemBuilder: ((context, index) {
                        return movieSectionList[index];
                      }),
                    ),
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 82,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.network(
                                      netflixLogo,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                        size: 28,
                                      )),
                                  Container(
                                    width: 24,
                                    height: 23,
                                    color: Colors.blue,
                                  ),
                                  kWidth,
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('TV shows', style: kHomeTitleText),
                                  Text('Movies', style: kHomeTitleText),
                                  Text('Categories', style: kHomeTitleText),
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight,
                ],
              ),
            );
          }),
    );
  }
}

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpServices().getTrending(TMDB.trending),
      builder: (context, AsyncSnapshot snapshot) {
        return Stack(
          children: [
            snapshot.hasData?
            Container(
              height: 500,
              width: double.infinity,
              decoration:  BoxDecoration(
                  image: DecorationImage(image: Image.network(TMDB.imageId + snapshot.data[2].image).image)),
            ):const SizedBox(height: 600,width: double.infinity),
            Positioned(
              bottom: 5,
              right: 10,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomButton(
                    icon: Icons.add,
                    text: 'My List',
                  ),
                  _PlayButton(),
                  CustomButton(
                    icon: Icons.info_outline,
                    text: 'Info',
                  )
                ],
              ),
            )
          ],
        );
      }
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconSize = 30,
      this.textSize = 18})
      : super(key: key);

  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Icon(icon, size: iconSize),
        Text(text, style: TextStyle(color: kWhite, fontSize: textSize)),
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
