
import 'package:ecommerce_app/Model/shopModel.dart';
import 'package:flutter/material.dart';

import 'sales_pages_design.dart';

class SalesPages extends StatefulWidget {
  List<ShopModelSales?>? sales;
  SalesPages(this.sales, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SalesPages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: widget.sales!.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingleSalesItem(widget.sales![index]!),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview())),
                      );
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}