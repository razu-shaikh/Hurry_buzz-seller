import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
      title: "Orders",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "assets/order.png");

  Items item2 = Items(
    title: "Sales",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "assets/sales.png",
  );
  Items item3 = Items(
    title: "Product",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/product.png",
  );
  Items item4 = Items(
    title: "Campaign",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/campaign.png",
  );
  Items item5 = Items(
    title: "Pending",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/pending.png",
  );
  Items item6 = Items(
    title: "Processing",
    subtitle: "",
    event: "2 Items",
    img: "assets/process.png",
  );
  Items item7 = Items(
    title: "Delivered",
    subtitle: "",
    event: "2 Items",
    img: "assets/delivery.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6,item7];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),

                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({required this.title, required this.subtitle, required this.event, required this.img});
}