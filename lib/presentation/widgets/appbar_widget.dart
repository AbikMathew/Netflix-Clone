import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(child: Text('Downloads')),
        IconButton(onPressed: (){}, icon: Icon(Icons.cast, color: Colors.white,)),
        Container(width: 24,height: 24,color: Colors.blue,),
        kWidth,
      ],),
    );
  }
}