import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [_SmartDownloads(), Section2(), Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppbarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List movieBannerList = [
      'https://i.pinimg.com/236x/6e/25/dd/6e25dda9360a16ba92e554b0337441fb.jpg',
      'https://i.pinimg.com/236x/3c/a6/1f/3ca61fe3614055f0bc11b1689a6991b4.jpg',
      'https://i.pinimg.com/236x/cc/f8/38/ccf83886d3821fd5578ad60f0df81657.jpg'
    ];

    return Column(
      children: [
        const Text(
          'Indroducing Downloads for you',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 19),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndeviced",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.35,
                  backgroundColor: Colors.grey.withOpacity(0.6),
                ),
              ),
              DownloadImageWidget(
                  movieBannerPic: movieBannerList[2],
                  margin: const EdgeInsets.only(left: 130, bottom: 30),
                  angle: 20,
                  size: Size(size.width * 0.4, size.height * 0.20)),
              DownloadImageWidget(
                  angle: -20,
                  movieBannerPic: movieBannerList[1],
                  margin: const EdgeInsets.only(right: 130, bottom: 30),
                  size: Size(size.width * 0.4, size.height * 0.20)),
              DownloadImageWidget(
                  movieBannerPic: movieBannerList[0],
                  margin: EdgeInsets.zero,
                  size: Size(size.width * 0.4, size.height * 0.25)),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kButtonBlue,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Set Up',
              style: TextStyle(
                  color: kWhite, fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
      ),
      kHeight,
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: kButtonWhite,
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'See what you can Download',
            style: TextStyle(
                color: kBlack, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    ]);
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.settings),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    required this.movieBannerPic,
    required this.margin,
    required this.size,
    this.angle = 0,
  }) : super(key: key);

  final String movieBannerPic;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(movieBannerPic)),
        ),
      ),
    );
  }
}
