
import 'package:ecommerce_app/Model/shopModel.dart';
import 'package:ecommerce_app/screen/shop/campaign/single_campaign_design.dart';
import 'package:flutter/material.dart';


class CampaignPages extends StatefulWidget {
  List<ShopModelCampaigns?>? campaigns;
  CampaignPages(this.campaigns, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CampaignPages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: widget.campaigns!.isNotEmpty ? ListView.builder(
                    itemCount: widget.campaigns!.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingleCampaignItem(widget.campaigns![index]!),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview())),
                      );
                    }
                ):Center(child: Text("No data found"))
            )
          ],
        ),
      ),
    );
  }
}