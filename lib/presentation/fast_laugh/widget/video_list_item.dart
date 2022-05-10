import 'package:flutter/material.dart'; 
import 'package:netflix_clone/core/constants.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
          
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side of Fast Laugh Stack
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhite,
                      size: 30,
                    ),
                  ),
                ),
              ),

              //Right side of Fast laugh Stack
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://mcdn.wallpapersafari.com/medium/86/57/6FxmsH.jpg'),
                    ),
                    kHeight,
                    VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionWidget(icon: Icons.add, title: 'List'),
                    VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 28,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
