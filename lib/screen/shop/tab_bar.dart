import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/shop/all_productList.dart';
import 'package:flutter/material.dart';
class TabBar_shop extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TabBar_shop> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: <Widget>[
          Padding(padding: const EdgeInsets.only(left: 10,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Shop Name', textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                    Text('Electronics', textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.add_moderator,
                        size: 20,
                        color: textColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.share,
                        size: 20,
                        color: textColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.star,
                          size: 20,
                          color: textColor,
                        ),
                      ),
                      Text('5.0', textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('(By 2000 people)', textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.shop,
                          size: 20,
                          color: textColor,
                        ),
                      ),
                      Text('122', textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              ),
          DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'All Products'),
                      Tab(text: 'Draft'),
                      Tab(text: 'sales'),
                      Tab(text: 'Campaigns'),
                    ],
                  ),
                ),
                Container(
                    height:230, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      AllProductList(),
                      Container(
                        child: Center(
                          child: Text('Display Tab 2', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 3', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 4', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ])
                )
              ])
          ),
        ]),

    );
  }
}