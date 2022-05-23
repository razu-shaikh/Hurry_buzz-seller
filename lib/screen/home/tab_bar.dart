import 'package:ecommerce_app/screen/dashBoard/all_productList.dart';
import 'package:flutter/material.dart';
class TabBar_shop extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TabBar_shop> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          SizedBox(height: 10.0),
          Text('Shop Name', textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
          DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'All Products'),
                      Tab(text: 'Draft'),
                      Tab(text: 'sales'),
                      Tab(text: 'Campaigns'),
                    ],
                  ),
                ),
                Container(
                    height: 290, //height of TabBarView
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