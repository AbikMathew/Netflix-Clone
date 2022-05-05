import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/appbar_widget.dart';

class ScreenHotAndNew extends StatelessWidget {
  const ScreenHotAndNew({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child:  AppbarWidget(title: 'Hot & New',)),
      body: Text('HotAndNew'),
    );
  }
}