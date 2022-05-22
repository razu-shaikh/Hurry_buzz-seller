import 'package:ecommerce_app/screen/dashBoard/dashboard.dart';
import 'package:ecommerce_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    Text('Report Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Dashboard'),
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                title: Text('Shop'),
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined),
              title: Text('Orders'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_fire_department_rounded),
                title: Text('Offers'),
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.report),
                title: Text('Report'),
                backgroundColor: Colors.yellow
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 25,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}