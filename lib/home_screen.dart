import 'package:flutter/material.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/feature/cart/cart_main.dart';
import 'package:klik_daily/feature/home/home_main.dart';
import 'package:klik_daily/feature/profile/profile_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  static const List<Widget> listPage = [
    HomeMain(),
    CartMain(),
    ProfileMain(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: pageIndex,
        selectedItemColor: klikGreen,
        onTap: _onItemTapped,
      ),
    );
  }
}
