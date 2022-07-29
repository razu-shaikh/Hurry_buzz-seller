import 'dart:convert';

import 'package:ecommerce_app/Model/notificationModel.dart';
import 'package:ecommerce_app/auth/screens/login_screen.dart';
import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/notification/webView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../shop/drawer_side.dart';
import 'notification_page_design.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<notification> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool _loading = false;
  bool get loading => _loading;


  setLoading(bool value){
    _loading = value;
  }

  Future<NotificationModel > initialize() async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    print("token"+authToken.toString());
    final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/notifications'),
      headers: {
        "apiKey": "sdfdge544364dg#",
        "Authorization": "Bearer $authToken"},
    );

    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      setLoading(false);
      return NotificationModel.fromJson(data);
    }else if(response.statusCode == 401){
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("token");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              (Route<dynamic> route) => false
      );
      return NotificationModel.fromJson(data) ;
    }else{
      setLoading(false);
      return NotificationModel.fromJson(data);
    }
  }
  Future<void>markedAll() async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/notifications_all_seen'),
      headers: {
        "apiKey": "sdfdge544364dg#",
        "Authorization": "Bearer $authToken"},
    );

    var data = jsonDecode(response.body.toString());
    print(data);
    // if(response.statusCode == 200){
    //   return NotificationModel.fromJson(data);
    // }else{
    //   return NotificationModel.fromJson(data);
    // }
  }
  Future<void>seeNotification(int id) async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/notification_seen/+$id'),
      headers: {
        "apiKey": "sdfdge544364dg#",
        "Authorization": "Bearer $authToken"},
    );

    var data = jsonDecode(response.body.toString());
    print(data);
    // if(response.statusCode == 200){
    //   return NotificationModel.fromJson(data);
    // }else{
    //   return NotificationModel.fromJson(data);
    // }
  }

  @override
  void initState() {
    initialize();
    setLoading(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Notifications",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),

                  ],
                )

              ],
            )

          ],
        ) ,
         actions: [
        //   // GestureDetector(
        //   //   onTap: () {
        //   //     scaffoldKey.currentState?.openDrawer();
        //   //   },
        //   //   child: Container(
        //   //     padding: EdgeInsets.all(8), // Border width
        //   //     decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
        //   //     child: ClipRRect(
        //   //       borderRadius: BorderRadius.circular(20),
        //   //       child: SizedBox.fromSize(
        //   //         size: Size.fromRadius(20), // Image radius
        //   //         child: Image.network('https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612', fit: BoxFit.cover),
        //   //       ),
        //   //     ),
        //   //   ),
        //   // ),
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
      // key: scaffoldKey,
      // drawer: Drawer(
      //   child:DrawerSide(),
      // ),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Container(
            //   height: 52,
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: TextField(
            //     onChanged: (value) {
            //       setState(() {
            //         //query = value;
            //       });
            //     },
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(30),
            //         borderSide: BorderSide.none,
            //       ),
            //         fillColor: Color(0xfff3f1f1),
            //       filled: true,
            //       hintText: "Search for items in the store",
            //       suffixIcon: Icon(Icons.search),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Notification',style: TextStyle(color: Colors.black, fontSize: 15)),
                InkWell(
                  onTap: () async{
                    markedAll();
                  } ,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                             child:Text("Marked as read",style: GoogleFonts.roboto(fontSize: 12,color:Colors.white, // light
                          )),
                        )

                      ),
                    ),

                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: loading?CircularProgressIndicator(color:Colors.blue): FutureBuilder<NotificationModel>(
                    future: initialize(),
                    builder: (context,snapShot){
                      if(snapShot.hasData){
                        return ListView.builder(
                            itemCount: snapShot.data!.notifications!.length,
                            itemBuilder: (context, index){
                              return GestureDetector(
                                child: SingalNotification(snapShot.data!.notifications![index]),
                                onTap: (){
                                  seeNotification(snapShot.data!.notifications![index].id??0);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewNotification(snapShot.data!.notifications![index].url)));
                                }
                              );
                            }
                        );
                      }else{
                        return Center(child: Text("No data found !!"));
                        return Center(
                           child:SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)) ,

                        );
                      }

                    }

                )
            ),
          ],
        ),
      ),
    );
  }
}