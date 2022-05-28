import 'package:ecommerce_app/screen/offers/item_design.dart';
import 'package:flutter/material.dart';

import 'item_single.dart';

class AllOfferList extends StatefulWidget {
  const AllOfferList({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllOfferList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text("Offers and Campaign",style: TextStyle(color:Colors.black,fontSize:20),),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: ItemDesign(),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemSingleDesign())),
                      );
                    }

                  )
              ),

            ],
          ),
        )
    );
  }
}