
import 'package:ecommerce_app/screen/shop/campaign/single_campaign_design.dart';
import 'package:flutter/material.dart';


class CampaignPages extends StatefulWidget {
  const CampaignPages({Key? key}) : super(key: key);

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
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingleCampaignItem(),
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