import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int newIndex, _ ){
      return BottomNavigationBar(
      currentIndex: newIndex,
      onTap: (index){
        indexChangeNotifier.value = index;
      },

      type: BottomNavigationBarType.fixed, // In order to make the background black you need this
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'New & Hot'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: 'Fast laugh'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
      ],
    );
    });
  }
}
