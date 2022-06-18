import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/widgets/costom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../notification/notification.dart';

class AddItemDetails extends StatefulWidget {
  const AddItemDetails({Key? key}) : super(key: key);

  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

class _AddDeliverAddressState extends State<AddItemDetails> {

  TextEditingController productNameController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController slugController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController minimumOrderController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();

  Widget bonntonNavigatorBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    String? title,
    IconData? iconData,
    Function()? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title!,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
  PickedFile? imageFile ;
  File? storedImage ;

  final ImagePicker _picker = ImagePicker();
  File? image;
  List<File> multipleImages = [];

  String categoryValue= 'Select Category';
  String brandValue= 'Brand';
  String discountTypeValue= 'Discount Type';
  var category = [
    'Select Category',
    '10',
    '13',
    'I20',
    'Item 5',
  ];
  var brand = [
    'Brand',
    '10',
    '17',
    '120',
    'Item 5',
  ];
  var discountType = [
    'Discount Type',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
    }


  Future<String?> addData(
      String name,
      var category_id,
      var brand_id,
      // String tags,
      // String slug,
      var current_stock,
      String unit,
      var price,
      // var minimum_order_quantity,
      var special_discount,
      // var special_discount_type,
      // var special_discount_period,
      // String description,
      String sku,
      // File imageFile,
      // List<File> files,
      String status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");

    var uri = Uri.parse("https://hurrybuzz.com/api/v1/seller/add_product");
    var request = http.MultipartRequest("POST", uri);

    Map<String, String> headers = {
      "apiKey": "sdfdge544364dg#",
      "Authorization": "Bearer $authToken"
    };
    request.headers.addAll(headers);

    // var stream = http.ByteStream(imageFile.openRead());
    //     stream.cast();
    // var length = await imageFile.length();
    //
    // var multipartFile =  http.MultipartFile('thumbnail', stream, length, filename: imageFile.path);
    // request.files.add(multipartFile);
    //
    // //multiple images
    // for (var file in files) {
    //   String fileName = file.path.split("/").last;
    //   var stream =  http.ByteStream(file.openRead());
    //   stream.cast();
    //   var length = await file.length(); //imageFile is your image file
    //
    //   var multipartFileSign =  http.MultipartFile('images', stream, length, filename: fileName);
    //
    //   request.files.add(multipartFileSign);
    // }
    //ignore this headers if there is no authentication

//adding params
    request.fields['name'] = name;
    request.fields['category_id'] = category_id;
    request.fields['brand_id'] = brand_id;
    // request.fields['tags'] = tags;
    // request.fields['slug'] = slug;
    request.fields['current_stock'] = current_stock;
    request.fields['unit'] = unit;
    request.fields['price'] = price;
   // request.fields['minimum_order_quantity'] = minimum_order_quantity;
    request.fields['special_discount'] = special_discount;
    //request.fields['special_discount_type'] = special_discount_type;
    //request.fields['special_discount_period'] = special_discount_period;
    //request.fields['description'] = description;
    request.fields['sku'] = sku;
    request.fields['status'] = status;

    var response = await request.send();

    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.red,
        title: Text(
          "Add Item Details",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
              },
              icon:Image.asset("assets/notification.png",width: 25,height: 25,color: Colors.white,),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              backgroundColor: Color(0xff1ed9d9),
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Save Draft",
              onTap: () {
              }),
          bonntonNavigatorBar(
              backgroundColor: Color(0xff1749e2),
              color: Colors.white70,
              iconColor: Colors.white70,
              title: "Published",
              onTap: () async {
                await addData(productNameController.text.toString(),
                  categoryValue,
                  brandValue,
                  // tagController.text.toString(),
                  // slugController.text.toString(),
                  stockController.text.toString(),
                  unitController.text.toString(),
                    unitPriceController.text.toString(),
                // minimumOrderController.text.toString(),
                  discountAmountController.text.toString(),
                 //discountTypeValue,
                   // "1234",
                   // descriptionController.text.toString(),
                  "sku",
                     // storedImage!,
                     // multipleImages,
                  "status"

                 );
              }),
        ],
      ),

      body:ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffd92e1e),
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(0),
                  child:( imageFile == null)?Text(""):Image.file(
                    File(imageFile!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                  padding:const EdgeInsets.only(bottom: 30,top: 30,left: 30),
                  child: Row(
                    children: [
                      Stack (
                        children: [
                          Container(
                            width:100,
                            height:100,
                            decoration: BoxDecoration(
                              color: Color(0xffd1ad17),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(2),
                              child:( imageFile == null)?Text(""):Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25,top: 25),
                            child:Align(
                              alignment: Alignment.center,
                              child:IconButton(onPressed: (){
                                _showChoiceDialog(context);
                              },
                                icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white70,),) ,
                            ) ,
                          )


                        ],

                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,top: 80),
                        child:Align(
                          alignment: Alignment.center,
                          child:IconButton(onPressed: (){
                            _openImageMulti(context);
                          },
                            icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white70,),) ,
                        ) ,
                      )

                    ],
                  ),
                ),

            ],
          ),
          Container(
            height: 150,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: multipleImages.isEmpty ? 1: multipleImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context,index)=> Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(.5))

                  ),
                  child: multipleImages.isEmpty ? Icon(CupertinoIcons.person):Image.file(File(multipleImages[index].path)),
                ),
              ),

          ),
         Padding(
             padding: EdgeInsets.all(10),
             child: Text("Basic Information",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter product Name',
                hintText: 'Product Name',
              ),
              controller: productNameController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 180,
                padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: DropdownButton(
                    underline: SizedBox(),
                    value: categoryValue,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: category.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        categoryValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: 180,
                padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: DropdownButton(
                    underline: SizedBox(),
                    value: brandValue,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: brand.map((String brand) {
                      return DropdownMenuItem(
                        value: brand,
                        child: Text(brand),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        brandValue = newValue!;
                      });
                    },
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Tags',
                hintText: 'Tags',
              ),
              controller: tagController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Slug',
                hintText: 'Slug',
              ),
              controller: slugController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Stock',
                    hintText: 'Stock',
                  ),
                  controller: stockController,
                ),
              ),
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unit KG',
                    hintText: 'KG',
                  ),
                  controller: unitController,
                ),
              ),

            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Unit Price',
                    hintText: 'Price',
                  ),
                  controller: unitPriceController,
                ),
              ),
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Minimum Order',
                    hintText: 'Order',
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  labelText: 'Product Description',// <-- SEE HERE
                ),
                maxLines: 5, // <-- SEE HERE
                minLines: 1,
              )
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text("Product Discount",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 180,
                padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Center(
                  child: DropdownButton(
                    underline: SizedBox(),
                    value: discountTypeValue,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: discountType.map((String discountType) {
                      return DropdownMenuItem(
                        value: discountType,
                        child: Text(discountType),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        discountTypeValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Discount Amount',
                    hintText: 'Discount Amount',
                  ),
                  controller: discountAmountController,
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Discount Period",
                hintText: 'Time',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text("Other Information",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          SizedBox(
            height: 10,
          ),
                CostomTextField(
                  labText: "Alternate Mobile No",
                  //controller: checkoutProvider.alternateMobileNo,
                ),
                CostomTextField(
                  labText: "Scoiety",
                  // controller: checkoutProvider.scoiety,
                ),
                CostomTextField(
                  labText: "Street",
                  // controller: checkoutProvider.street,
                ),
                CostomTextField(
                  labText: "Landmark",
                  //controller: checkoutProvider.landmark,
                ),
                CostomTextField(
                  labText: "City",
                  //controller: checkoutProvider.city,
                ),
                CostomTextField(
                  labText: "Area",
                  //controller: checkoutProvider.aera,
                ),
                CostomTextField(
                  labText: "PinCode",
                  //controller: checkoutProvider.pincode,
                ),
                Divider(
                  color: Colors.black,
                ),

              ],
            ),
    );
  }

  /// Get from gallery
  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      imageFile = pickedFile!;
      storedImage = File(imageFile!.path);
      print(imageFile);
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      imageFile = pickedFile!;
     storedImage = File(imageFile!.path);
    });
    Navigator.pop(context);
  }

  void _openImageMulti(BuildContext context)  async{
    List<XFile>? picked = await _picker.pickMultiImage();
    setState(() {
      multipleImages = picked!.map((e) => File(e.path)).toList();
    });
   // Navigator.pop(context);
  }
}
