import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
        preferredSize:  Size.fromHeight(40),
        child: AppbarWidget(title: 'Downloads',)),
      body: ListView(
        children: [
          Row(children: [
            const Icon(Icons.settings),
            const Text('Smart Downloads')
          ],),
          Text('Indroducing Downloads for you'),
          Text("We'll download a personalised selection of movies and shows for you, so there's always something to watch on your deviced"),
          MaterialButton(color: kButtonBlue,onPressed: (){}, child: Text('Set Up'),)
        ],
      ),
    );
  }
}