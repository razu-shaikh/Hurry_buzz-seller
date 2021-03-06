import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ShopTypeDropDown extends StatefulWidget {
  var shopSelection;
  ShopTypeDropDown(this.shopSelection);

  State createState() => new MyAppState();
}
class MyAppState extends State<ShopTypeDropDown> {

  final String url = "https://hurrybuzz.com/api/v1/seller/shop_types";

  List data = []; //edited line

  Future<String> getSWData() async {
    var res = await http
        .post(Uri.parse(url),
        headers: {"apiKey": "sdfdge544364dg#"});
    var resBody = jsonDecode(res.body);

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    getSWData();
  }

  @override
  Widget build(BuildContext context) {
   // print(users);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
           child: DropdownButton(
             underline: SizedBox(),
             isExpanded: true,
             iconSize: 36,
                items: data.map((item) {
                 return DropdownMenuItem(
                 child: Text(item['name']),
                 value: item['id'],
              );
         }).toList(),
            onChanged: ( newVal) {
           setState(() {
             widget.shopSelection = newVal;
           });
        },
         value: widget.shopSelection,
        ),
        ),
      ],
    );
  }
}
