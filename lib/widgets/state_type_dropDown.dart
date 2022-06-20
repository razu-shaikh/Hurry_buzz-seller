import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class StateTypeDropDown extends StatefulWidget {
  var stateSelection;
  StateTypeDropDown(this.stateSelection);

  State createState() => new MyAppState();
}
class MyAppState extends State<StateTypeDropDown> {

  final String url = "https://hurrybuzz.com/api/v1/seller/states";

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
                widget.stateSelection = newVal;
              });
            },
            value: widget.stateSelection,
          ),
        ),
      ],
    );
  }
}
