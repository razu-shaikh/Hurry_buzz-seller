import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CityTypeDropDown extends StatefulWidget {
  var citySelection;
  CityTypeDropDown(this.citySelection);

  State createState() => new MyAppState();
}
class MyAppState extends State<CityTypeDropDown> {

  final String url = "https://hurrybuzz.com/api/v1/seller/cities";

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
                widget.citySelection = newVal;
              });
            },
            value: widget.citySelection,
          ),
        ),
      ],
    );
  }
}
