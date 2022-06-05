import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

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
          size: 28,
        ),
        title: Text(
          title!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                       // backgroundImage: NetworkImage(),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("name", style: TextStyle(
                          color: Colors.white,
                        ),),//
                        Text(
                          'email',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {

              },
            ),
            listTile(
                iconData: Icons.notifications_outlined, title: "Notification"),
            listTile(iconData: Icons.star_outline, title: "Rating & Review"),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {
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
                    children: const [
                      Text("Call us:",style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+923352580282",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        Text("Mail us:",style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "rajushikhpau@gmail.com",style: TextStyle(color: Colors.white),
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
}