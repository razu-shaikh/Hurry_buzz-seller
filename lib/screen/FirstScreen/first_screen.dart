import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:ecommerce_app/screen/addItem/add_item.dart';
import 'package:ecommerce_app/screen/dashBoard/HomeScreen.dart';
import 'package:ecommerce_app/screen/shop/home_screen.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../notification/notification.dart';
import '../offers/offers.dart';
import '../orders/orders_pages.dart';
import '../report/product_report.dart';
import '../shop/drawer_side.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  late String _title;
  var scaffoldKey = GlobalKey<ScaffoldState>();
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
      switch(index) {
        case 0: { _title = 'Demo Shop'; }
        break;
        case 1: { _title = 'Shop Name'; }
        break;
        case 2: { _title = 'Orders'; }
        break;
        case 3: { _title = 'Offers'; }
        break;
        case 4: { _title = 'Sales Report'; }
        break;
      }
    });
  }
  @override
  initState(){
    _title = 'Some default value';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                if (_selectedIndex == 0)
                Image.asset("assets/giftbox.png",width: 25,height: 25,),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_title,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    if (_selectedIndex == 0)
                      Text('Mohammadpur Dhaka 1212',style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                  ],
                )

              ],
            )

          ],
        ) ,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
              },
              icon:Image.asset("assets/notification.png",width: 25,height: 25,color: Colors.white,),
            ),
          ),
          if (_selectedIndex == 0)
            GestureDetector(
              onTap: () {
               scaffoldKey.currentState?.openEndDrawer();
               },
              child: Container(
                padding: EdgeInsets.all(8), // Border width
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(20), // Image radius
                    child: Image.network('https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612', fit: BoxFit.cover),
                  ),
                ),
              ),
            ),

        ],
      ),
      key: scaffoldKey,
      endDrawer: Drawer(
        child:DrawerSide(),
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
        child: const Icon(Icons.add,size: 30,),
      ),
    );
  }}