// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  // With the _selectedIndex = 0, whenever we click the Shop Now, the page that will be shown by default will be the Shop page, if the _selectedIndex was 1 then it will show the cart page by default. This is base on  the list of link pages we created below
  int _selectedIndex = 0;

  // this method will update our selected index
  //  when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
          _selectedIndex = index;
        });
  }

  // pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    backgroundColor: Colors.grey[300],
    bottomNavigationBar: MyBottomNavBar(
      onTabChange: (index) => navigateBottomBar(index),
    ),
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading:
      Builder(
        builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left:12.0),
              child: Icon(
              Icons.menu,
              color: Colors.black,
              ),
            ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          } ,
          )
      ),
    ),
    drawer: Drawer(
  backgroundColor: Colors.grey[900],
  child: Column(
    children: [
      Expanded(
        child: Column(
          children: [
            // Logo
            DrawerHeader(
              child: Image.asset(
                'images/Nike Logo.png',
                color: Colors.white,
              ),
            ),
            // Other pages
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Home', style: TextStyle(color: Colors.white)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white),
                title: Text('About', style: TextStyle(color: Colors.white)),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      // Logout Button
      const Padding(
        padding: EdgeInsets.only(left: 25, bottom: 25),
        child: ListTile(
          leading: Icon(Icons.logout, color: Colors.white),
          title: Text('Logout', style: TextStyle(color: Colors.white)),
        ),
      ),
    ],
  ),
),

    body: _pages[_selectedIndex],
   );
  }
}

