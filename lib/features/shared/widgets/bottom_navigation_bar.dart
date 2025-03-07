import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;
    if (location == '/search') {
      currentIndex = 1;
    } else if (location == '/favourites') {
      currentIndex = 2;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex, // Set the current index
      selectedItemColor: Colors.blueAccent,
      onTap: (index) {
        switch (index) {
          case 0:
            context.goNamed('$index');
            break;
          case 1:
            context.goNamed('$index');
            break;
          case 2:
            context.goNamed('$index');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favourites',
        ),
      ],
    );
  }
}
