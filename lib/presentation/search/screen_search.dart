import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widget/search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              padding: const EdgeInsets.all(9),
              backgroundColor: Colors.grey.withOpacity(0.4),
              style: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
            ),
            kHeight,
           // const Expanded(child:  SearchIdleWidget()),
            const Expanded(child: SearchResultWidget()),
          ],
        ),
      )),
    );
  }
}
