import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: Text(title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          )),
          IconButton(
              onPressed: () {},
              icon: Icon(
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
    );
  }
}
