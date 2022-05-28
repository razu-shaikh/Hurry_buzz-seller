import 'package:ecommerce_app/screen/addItem/add_item.dart';
import 'package:ecommerce_app/screen/dashBoard/HomeScreen.dart';
import 'package:ecommerce_app/screen/shop/home_screen.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../offers/offers.dart';
import '../orders/orders_pages.dart';
import '../report/product_report.dart';

class MyNavigationBar extends StatefulWidget {

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    //HomePage(),
    MyApp(),
    HomeScreen(),
    Order_pages(),
    AllOfferList(),
    AllProductReport()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title: Text('Sale Report',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        actions: [
          const SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.add_alert_outlined,
                size: 20,
                color: textColor,
              ),
            ),
          ),

        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
          items:  const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Dashboard',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_fire_department_rounded),
                label: 'Offers',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: 'Report',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 25,
          onTap: _onItemTapped,
          elevation: 5
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemDetails()),
          );
        },
        backgroundColor: Colors.black54,
        child: const Icon(Icons.add_circle_outline_sharp,size: 30,),
      ),
    );
  }}