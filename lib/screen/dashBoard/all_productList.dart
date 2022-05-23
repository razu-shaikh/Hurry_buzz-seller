import 'package:flutter/material.dart';

class AllProductList extends StatefulWidget {
  AllProductList({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllProductList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(
          children: [
            Card(
                child: ListTile(
                  title:Text("List Item 1") ,
                )
            ),
            Card(
                child: ListTile(
                  title:Text("List Item 1") ,
                )
            ),
            Card(
                child: ListTile(
                  title:Text("List Item 1") ,
                )
            ),
            Card(
                child: ListTile(
                  title:Text("List Item 1") ,
                )
            ),
            Card(
                child: ListTile(
                  title:Text("List Item 1") ,
                )
            ),
            Card(
              child: ListTile(
                title: Text("List Item 2"),
              ),
            ),
            Card(
                child: ListTile(
                  title: Text("List Item 3"),
                )
            ),
          ],
          shrinkWrap: true,
        )
    );
  }
}