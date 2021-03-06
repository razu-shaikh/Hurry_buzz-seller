import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/profile_model.dart';
import 'package:ecommerce_app/auth/screens/login_screen.dart';
import 'package:ecommerce_app/screen/addItem/add_item.dart';
import 'package:ecommerce_app/screen/dashBoard/HomeScreen.dart';
import 'package:ecommerce_app/screen/shop/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  bool status = true ;
  Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  int _selectedIndex = 0;
  late String _title;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  static  List<Widget> _widgetOptions = <Widget>[
    //HomePage(),
    DashBoardPage(),
    HomeScreen(),
    Order_pages(),
    AllOfferList(),
    AllProductReport()

  ];

  String? image;
  String? shopnName;
  String? address;

  Future<void> initialize() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    Profile? profileData ;
    try {
      final response = await Dio().post('https://hurrybuzz.com/api/v1/seller/me',
        options: Options(
            headers: {
              "apiKey": "sdfdge544364dg#",
              "Authorization": "Bearer $authToken"}),
      );
      Map<String,dynamic> profileDataList= response.data;
      // print("sssssssssssssss");
      // print(response.statusCode);
      if(response.statusCode == 200) {
        // _dashboardData.clear();
        profileData = Profile.fromJson(profileDataList);
        setState(() {
          image = profileData!.user!.profileImage;
          shopnName = profileData.user!.sellerProfile!.shopName;
          address = profileData.user!.sellerProfile!.address;

        });
       }else if(response.statusCode == 401){
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove("token");
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                (Route<dynamic> route) => false
        );
      }else{

      }
      //else{
      //   SharedPreferences pref = await SharedPreferences.getInstance();
      //   pref.remove("token");
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => LoginScreen())
      //   );
      // }
    } catch (e) {
      print(e);
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index) {
        case 0: { _title = 'Demo Shop'; }
        break;
        case 1: { _title = shopnName!; }
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
  void initState() {
    checkRealtimeConnection();
    _title = 'DashBoard';
    initialize();
    super.initState();
  }
  void checkRealtimeConnection() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      setState(() {
        if (event == ConnectivityResult.mobile) {
          status = true;
        } else if (event == ConnectivityResult.wifi) {
          status = true;
        } else {
          status = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future<bool> showExitPopup() async {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red),
              onPressed: () => Navigator.of(context).pop(false),
              child:Text('No' ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red),
              onPressed: () => Navigator.of(context).pop(true),
              child:Text('Yes'),
            ),

          ],
        ),
      )??false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child:Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: Colors.red,
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8), // Border width
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(20), // Image radius
                          child: status?Image.network(image??"", fit: BoxFit.cover):Icon(
                          Icons.person,color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      status?(
                      _selectedIndex == 0 ? Text(shopnName??"",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ):Text(_title,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )):Text("Shop Name",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                        status?Text(address??"",style: TextStyle(color: Colors.white, fontSize: 12),):
                        Text("Address",style: TextStyle(color: Colors.white, fontSize: 12)),
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


          ],
        ),
        key: scaffoldKey,
        drawer: Drawer(
          child:DrawerSide(),
        ),
        body: Center(
          child:status?_widgetOptions.elementAt(_selectedIndex):Text("No Internet Connection"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
            items:  const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon( AssetImage("assets/store.png"),
                  size: 23,),
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
                  icon: Icon(Icons.report_gmailerrorred_outlined),
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
              MaterialPageRoute(builder: (context) => AddItemDetails(false,null,"","","","","","","","","","","","","","","","")),
            );
          },
          backgroundColor: Colors.black54,
          child: const Icon(Icons.add,size: 30,),
        ),
      ),
    );
  }}