import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingleDraftItem extends StatefulWidget {
  bool? isBool = false;
  String? productId;
  String? productImage;
  String? productName;
  bool? wishList = false;
  int? productPrice;
  int? productQuantity;
  final void Function()? onDelete;
  var productUnit;

  // final ProductModel? unitProduct;

  SingleDraftItem({
    this.productQuantity,
    this.productId,
    this.productUnit,
    this.onDelete,
    this.isBool,
    this.productImage,
    this.productName,
    this.productPrice,
    this.wishList,
    //this.unitProduct
  });

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleDraftItem> {
  //late ReviewCartProvider reviewCartProvider;

  var unitData;
  var firstValue;

  int count = 0;

  getCount() {
    setState(() {
      count = widget.productQuantity ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.isBool == false
        ? widget.productUnit.productUnit.firstWhere((element) {
            setState(() {
              firstValue = element;
            });
            return true;
          })
        : getCount();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 1, color: Color(0xFFD4D4D4))),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'productName',
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "#123456",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "10",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "min ago",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$10",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "pics",
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Publish",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(right: 10, top: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(Icons.edit_outlined)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
