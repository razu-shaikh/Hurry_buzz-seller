import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/shop/allProduct/all_productList.dart';
import 'package:ecommerce_app/screen/shop/draft/draft.dart';
import 'package:ecommerce_app/screen/shop/sales/sales.dart';
import 'package:flutter/material.dart';

import '../../offers/offers.dart';
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
          DefaultTabController(
              length: 4, // length of tabs
              initialIndex: 0,
              child: Column(
                  children: <Widget>[
                Container(
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black54,
                    tabs: const [
                      Tab(text: 'All Products'),
                      Tab(text: 'Draft'),
                      Tab(text: 'sales'),
                      Tab(text: 'Campaigns'),
                    ],
                  ),
                ),
                Container(
                    height:320, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      AllProductList(),
                      DraftPages(),
                      SalesPages(),
                      AllOfferList(),
                    ]
                    )
                )
              ])
          ), SizedBox( // <-- use a sized box and change the height
                  height: 30.0)
        ]),

    );
  }
}