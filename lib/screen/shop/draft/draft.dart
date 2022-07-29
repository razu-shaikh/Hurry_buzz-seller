
import 'package:ecommerce_app/Model/shopModel.dart';
import 'package:flutter/material.dart';

import 'draft_item_design.dart';

class DraftPages extends StatefulWidget {
  List<ShopModelDraft?>? draft;
  DraftPages(this.draft, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DraftPages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child:widget.draft!.isNotEmpty? ListView.builder(
                    itemCount: widget.draft!.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingleDraftItem(widget.draft![index]!),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview())),
                      );
                    }
                ):Center(child: Text("No data found !!"))
            ),
          ],
        ),
      ),
    );
  }
}