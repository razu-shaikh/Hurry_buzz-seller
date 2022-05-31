
import 'package:flutter/material.dart';

import 'draft_item_design.dart';

class DraftPages extends StatefulWidget {
  const DraftPages({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DraftPages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingleDraftItem(),
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