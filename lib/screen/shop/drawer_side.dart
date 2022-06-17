import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/profile_model.dart';
import 'package:ecommerce_app/auth/screens/login_screen.dart';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerSide extends StatefulWidget {
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({String? title, IconData? iconData, Function()? onTap}) {
    return SizedBox(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: Colors.white,
          size: 28,
        ),
        title: Text(
          title!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String? image;
  String? name;
  String? email;


  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }

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

      if(response.statusCode == 200) {
        // _dashboardData.clear();
        profileData = Profile.fromJson(profileDataList);
        setState(() {
          image = profileData!.user!.profileImage;
          name = profileData.user!.firstName;
          email = profileData.user!.email;

        });
        setLoading(false);
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    setLoading(true);
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // final authProvider = Provider.of<AuthProvider>(context);
    // var data = authProvider.authData!.data!.user;
    // final String? profilePic= data!.profileImage;
    // final String? phone= data.phone;
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child:loading?SizedBox(width:15,height:15,child:CircularProgressIndicator(color:Colors.white,)):
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(image?? ""),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name??"name", style: TextStyle(
                          color: Colors.white,
                        ),),//data.fullName.toString()
                        Text(email??"email",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),//data.email.toString()
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyNavigationBar(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Coupons",
              onTap: () {
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "Payment Account",
              onTap: () {

              },
            ),
            listTile(iconData: Icons.star_outline, title: "Rating & Review"),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Help & Support",
                onTap: () {
                }),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Terms & Policy",
                onTap: () {
                }),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Settings",
                onTap: () {
                }),
            listTile(
                iconData: Icons.logout,
                title: "LogOut",
                onTap: () async{
                  await setToken(null);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                }),
            listTile(iconData: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support",style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Text("Call us:",style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      Text("01768598844",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:",style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(email??"email",style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> setToken(token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", "");

  }
}