import 'package:ecommerce_app/Model/shopModel.dart';
import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/addItem/add_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingleSalesItem extends StatefulWidget {
  ShopModelSales shopModelSales;
  SingleSalesItem(this.shopModelSales,);

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleSalesItem> {

  bool update = true;
  @override
  Widget build(BuildContext context) {

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
                        image: widget.shopModelSales.images!.isNotEmpty? NetworkImage(
                            'https://hurrybuzz.com/public/'+widget.shopModelSales.images![0]!.originalImage.toString()
                        ):NetworkImage(
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
                          Text(widget.shopModelSales.productLanguages![0]!.name.toString(),
                            overflow: TextOverflow.ellipsis,
                            //'productName',
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
                              Text(widget.shopModelSales.productLanguages![0]!.productId.toString(),
                                //"#123456",
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
                              Text(widget.shopModelSales.price.toString(),
                                //"\$10",
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
                                widget.shopModelSales.productLanguages![0]!.unit.toString(),
                                //"pics",
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
                                  child: Text(widget.shopModelSales.status.toString(),
                                   // "Publish",
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
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddItemDetails(
                        update,
                        widget.shopModelSales.id,
                        widget.shopModelSales.productName,
                        widget.shopModelSales.categoryId,
                        widget.shopModelSales.brandId,
                        widget.shopModelSales.productLanguages![0]?.tags,
                        widget.shopModelSales.slug,
                        widget.shopModelSales.currentStock,
                        widget.shopModelSales.productLanguages![0]?.unit,
                        widget.shopModelSales.price,
                        widget.shopModelSales.minimumOrderQuantity,
                        widget.shopModelSales.productLanguages![0]?.description,
                        widget.shopModelSales.productLanguages![0]?.shortDescription,
                        widget.shopModelSales.status,
                        widget.shopModelSales.specialDiscountType,
                        widget.shopModelSales.specialDiscount,
                        widget.shopModelSales.specialDiscountStart,
                        widget.shopModelSales.specialDiscountEnd,

                      )));
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(right: 10, top: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.edit_outlined)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}