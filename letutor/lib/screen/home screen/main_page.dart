import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key ?? const ValueKey<String>('HomeScreen'));

  final StatefulNavigationShell child;

  void _onItemSelected(int index) {
    child.goBranch(
      index,
      initialLocation: index == child.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.discount,
            ),
            label: 'Ưu đãi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.luggage_outlined,
            ),
            label: 'Chuyến đi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face_6_outlined,
            ),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: child.currentIndex,
        onTap: _onItemSelected,
        selectedItemColor: const Color.fromARGB(255, 248, 75, 0),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 10.0,
      ),
    );
  }
}
