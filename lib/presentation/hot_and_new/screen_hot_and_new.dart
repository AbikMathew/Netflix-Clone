import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/appbar_widget.dart';

import '../../core/constants.dart';

class ScreenHotAndNew extends StatelessWidget {
  const ScreenHotAndNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'New & Hot',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          actions: [
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
          bottom:  TabBar(
            isScrollable: true,
            unselectedLabelColor: kWhite,
            labelColor: kBlack,
            labelStyle: kHomeTitleText,
            indicator: BoxDecoration(color: kWhite, borderRadius: kBorderRadius30),
            tabs:const [
            Tab(text: "🍿 Coming Soon"),
            Tab(text: "👀 Everone's watching")
          ]),
        ),
        body: TabBarView(children:  [
          _buildTabBarView('Coming Soon'),
          _buildTabBarView("Everyon's watching"),
        ]),
      ),
    );
  }

  _buildTabBarView(String title){
    return Center(child: Text(title),);
  }
}
