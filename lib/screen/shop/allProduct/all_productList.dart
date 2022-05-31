import 'package:flutter/material.dart';

import 'single_product.dart';

class AllProductList extends StatefulWidget {
  const AllProductList({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllProductList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children:[
                  SingalProduct(),
                  SingalProduct(),
                  SingalProduct(),
                  SingalProduct(),
                  SingalProduct()
                ],

            ),
            )
          ],
          shrinkWrap: true,
        )
    );
  }
}