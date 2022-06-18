import 'package:ecommerce_app/Model/shopModel.dart';
import 'package:ecommerce_app/screen/shop/allProduct/all_productList.dart';
import 'package:ecommerce_app/screen/shop/campaign/campaignList.dart';
import 'package:ecommerce_app/screen/shop/draft/draft.dart';
import 'package:ecommerce_app/screen/shop/sales/sales.dart';
import 'package:flutter/material.dart';
class TabBar_shop extends StatefulWidget {

  ShopModel shopModel;
  TabBar_shop(this.shopModel);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TabBar_shop> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      Tab(text: 'Published'),
                      Tab(text: 'Draft'),
                      Tab(text: 'sales'),
                      Tab(text: 'Campaigns'),
                    ],
                  ),
                ),
                Container(
                    height:440, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: Center(
                      child: TabBarView(children: <Widget>[
                                 AllProductList(widget.shopModel.published),
                                  DraftPages(),
                                 SalesPages(),
                                 CampaignPages()
                      ]
                      ),
                    )
                ),

              ])
          ),
        ]);

  }
}