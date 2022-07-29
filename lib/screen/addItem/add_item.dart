import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:ecommerce_app/screen/shop/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../notification/notification.dart';

class AddItemDetails extends StatefulWidget {
  bool update;
  var productId;
  var productName;
  var categoryId;
  var brandId;
  var tags;
  var slug;
  var currentStock;
  var unit;
  var price;
  var minimumOrderQuantity;
  var description;
  var shortDescription;
  var status;
  var specialDiscountType;
  var specialDiscount;
  var specialDiscountStart;
  var specialDiscountEnd;
  AddItemDetails(
      this.update,
      this.productId,
      this.productName,
      this.categoryId,
      this.brandId,
  this.tags,
  this.slug,
  this.currentStock,
  this.unit,
  this.price,
  this.minimumOrderQuantity,
  this.description,
  this.shortDescription,
  this.status,
  this.specialDiscountType,
  this.specialDiscount,
  this.specialDiscountStart,
  this.specialDiscountEnd,{Key? key}) : super(key: key);

  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

class _AddDeliverAddressState extends State<AddItemDetails> {

  final formKey = GlobalKey<FormState>();

  bool isVisibility = false;
  bool iconChange = false;

  TextEditingController productNameController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController slugController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController minimumOrderController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  TextEditingController shortDesController = TextEditingController();
  TextEditingController skuController = TextEditingController();

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

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    setState(() {
      _loading = value;
    });
  }

  PickedFile? imageFile ;
  File? storedImage ;

  final ImagePicker _picker = ImagePicker();
  //File? image;
 // List<File> multipleImages = [];
  List<XFile> imageList = [];// list of file
  List<String> _imageNameList = [];

 // String  categoryValue = 'Select Category';
 //  String brandValue = 'Brand' ;
  String discountTypeValue= 'Discount Type';

  var categoryValue;
  List<dynamic> catData =[];//edited line
  Future<void> getCategoryData() async {
    var res = await http
        .post(Uri.parse("https://hurrybuzz.com/api/v1/seller/categories"),
        headers: {"apiKey": "sdfdge544364dg#"});

    Map<String, dynamic> map = json.decode(res.body);


    setState(() {
      catData = map["categories"];
      // catData = resBody;
    });
    //return "Sucess";
  }
  var brandValue;
  //List brandData = [];
  List<dynamic> brandData=[];//edited line
  Future<void> getSWDataBrand() async {
    var res = await http
        .post(Uri.parse("https://hurrybuzz.com/api/v1/seller/brands"),
        headers: {"apiKey": "sdfdge544364dg#"});
    Map<String, dynamic> map = json.decode(res.body);
    setState(() {
      brandData = map["brands"];
    });
    //return "Sucess";
  }

  var discountType = [
    'Discount Type',
    'type 1',
    'type 2',
    'type 3',
    'type 4',
  ];

  // Future<void>_showChoiceDialog(BuildContext context)
  // {
  //   return showDialog(context: context,builder: (BuildContext context){
  //
  //     return AlertDialog(
  //       title: Text("Choose option",style: TextStyle(color: Colors.blue),),
  //       content: SingleChildScrollView(
  //         child: ListBody(
  //           children: [
  //             Divider(height: 1,color: Colors.blue,),
  //             ListTile(
  //               onTap: (){
  //                 _openGallery(context);
  //               },
  //               title: Text("Gallery"),
  //               leading: Icon(Icons.account_box,color: Colors.blue,),
  //             ),
  //
  //             Divider(height: 1,color: Colors.blue,),
  //             ListTile(
  //               onTap: (){
  //                 _openCamera(context);
  //               },
  //               title: Text("Camera"),
  //               leading: Icon(Icons.camera,color: Colors.blue,),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  //   }

  Future<String?> addData(
      var productId,
      String name,
      var category_id,
      var brand_id,
      String tags,
      String slug,
      var current_stock,
      String unit,
      var price,
      var minimum_order_quantity,
      var shortDes,
      // var special_discount,
      // var special_discount_type,
      // var special_discount_period,
      String description,
      String sku,
      // File imageFile,
     // List<XFile> files,
      String status) async {
      setLoading(true);
    print("click");

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    //  print("============"+productId.toString()+name+category_id+brand_id+tags+slug+current_stock+unit+price+minimum_order_quantity+shortDes+description+sku+status);
      var uri;
     if(widget.update !=true){
       uri = Uri.parse("https://hurrybuzz.com/api/v1/seller/add_product");
     }else{
       uri = Uri.parse("https://hurrybuzz.com/api/v1/seller/update_product");
     }
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


   // ignore this headers if there is no authentication

//adding params
   // print("============"+productId.toString()+name+category_id+brand_id+tags+slug+current_stock+unit+price+minimum_order_quantity+shortDes+description+sku+status);
    if(widget.update == true){
      request.fields['id'] = productId.toString();
    }
    request.fields['name'] = name;
    request.fields['category_id'] = category_id;
    request.fields['brand_id'] = brand_id;
    request.fields['tags'] = tags;
    request.fields['slug'] = slug;
    request.fields['current_stock'] = current_stock;
    request.fields['unit'] = unit;
    request.fields['price'] = price;
    request.fields['minimum_order_quantity'] = minimum_order_quantity;
    request.fields['short_description'] = shortDes;
    // request.fields['special_discount'] = special_discount;
    // request.fields['special_discount_type'] = special_discount_type;
    // request.fields['special_discount_period'] = special_discount_period;
    request.fields['description'] = description;
    request.fields['sku'] = sku;
    request.fields['status'] = status;

    var response = await request.send();
    print(response.statusCode);
    //request.files.add(multipartFile);
    //multiple images

    // for (var file in files) {
    //   String fileName = file.path.split("/").last;
    //   var stream =  http.ByteStream(file.openRead());
    //   stream.cast();
    //   var length = await file.length(); //imageFile is your image file
    //
    //   var multipartFileSign =  http.MultipartFile('images', stream, length, filename: fileName);
    //   request.files.add(multipartFileSign);
    // }


    response.stream.transform(utf8.decoder).listen((value) {
      Fluttertoast.showToast(msg: value,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 15);
      //print(value);
    });
    setLoading(false);
  }
  @override
  void initState() {
    setLoading(false);
    getCategoryData();
    getSWDataBrand();
    productNameController.text = widget.productName;
    // if(widget.update==true){
    //   categoryValue = int.parse(widget.categoryId);
    //   brandValue = int.parse(widget.brandId);
    // }
    tagController.text = widget.tags;
    slugController.text = widget.slug;
    stockController.text = widget.currentStock;
    unitController.text = widget.unit;
    unitPriceController.text = widget.price;
    minimumOrderController.text = widget.minimumOrderQuantity;
    descriptionController.text = widget.description;
    shortDesController.text = widget.shortDescription;
    //discountTypeValue = widget.specialDiscountType;
    discountAmountController.text = widget.specialDiscount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print(widget.categoryId+"======="+widget.brandId.toString());
    print(widget.productName+"======="+widget.brandId.toString());
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
              color: Colors.white,
              iconColor: Colors.grey,
              title: "Save Draft",
              onTap: () async{
                SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green));
                final isValidForm = formKey.currentState!.validate();
                if(isValidForm){
                  await addData(
                      widget.productId,
                      productNameController.text.toString(),
                categoryValue??widget.categoryId,
                brandValue??widget.brandId,
                tagController.text.toString(),
                slugController.text.toString(),
                stockController.text.toString(),
                unitController.text.toString(),
                unitPriceController.text.toString(),
                minimumOrderController.text.toString(),
                shortDesController.text.toString(),
                // discountAmountController.text.toString(),
                // discountTypeValue,
                //"1234",
                descriptionController.text.toString(),
                skuController.text.toString(),
                //storedImage,
                //imageList,
                "unpublished"
                // statusController.text.toString()

                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyNavigationBar()));
                }
              }),
          bonntonNavigatorBar(
              backgroundColor: Color(0xff1749e2),
              color: Colors.white,
              iconColor: Colors.white70,
              title:widget.update?"Update":"Published",
              onTap: () async {
                SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green));
                final isValidForm = formKey.currentState!.validate();
                if(isValidForm){
                  await addData(
                      widget.productId,
                      productNameController.text.toString(),
                      categoryValue??widget.categoryId,
                      brandValue??widget.brandId,
                      tagController.text.toString(),
                      slugController.text.toString(),
                      stockController.text.toString(),
                      unitController.text.toString(),
                      unitPriceController.text.toString(),
                      minimumOrderController.text.toString(),
                      shortDesController.text.toString(),
                      // discountAmountController.text.toString(),
                      // discountTypeValue,
                      //"1234",
                      descriptionController.text.toString(),
                      skuController.text.toString(),
                      //storedImage,
                      //imageList,
                      "published"
                     // statusController.text.toString()

                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyNavigationBar()));
                }
              }),
        ],
      ),

      body:Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            // Stack(
            //   children: [
                // Container(
                //   height: 170,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Color(0xffd92e1e),
                //     borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                //   ),
                //   child:Padding(
                //     padding: const EdgeInsets.all(0),
                //     child:( imageFile == null)?Text(""):Image.file(
                //       File(imageFile!.path),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),

                // Padding(
                //     padding:const EdgeInsets.only(bottom: 10,top: 10,left: 50),
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 2,top: 2),
                //           child: Text("Add Images:",style: GoogleFonts.besley(fontSize: 18,color:Colors.red,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
                //           )),
                //         ),
                //         SizedBox(width: 6,),
                //         Stack (
                //           children: [
                //             Container(
                //               width:80,
                //               height:80,
                //               decoration: BoxDecoration(
                //                 color: Colors.red,
                //                 borderRadius: BorderRadius.circular(5),
                //               ),
                //
                //             ),
                //             // Padding(
                //             //   padding: const EdgeInsets.only(left: 2,top: 2),
                //             //   child:Align(
                //             //     alignment: Alignment.center,
                //             //     child:IconButton(onPressed: (){
                //             //     },
                //             //       icon: Icon(Icons.image,size: 80,color: Colors.white70,),) ,
                //             //   ) ,
                //             // ),
                //             Padding(
                //               padding: const EdgeInsets.only(left: 15,top: 20),
                //               child:Align(
                //                 alignment: Alignment.center,
                //                 child:IconButton(onPressed: (){
                //                   //ImageUploadAndViewPage();
                //                   //_openImageMulti(context);
                //                 },
                //                   icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white,),) ,
                //               ) ,
                //             ),
                //
                //           ],
                //
                //         ),
                //         // Padding(
                //         //   padding: const EdgeInsets.only(left: 200,top: 80),
                //         //   child:Align(
                //         //     alignment: Alignment.center,
                //         //     child:IconButton(onPressed: (){
                //         //       _showChoiceDialog(context);
                //         //     },
                //         //       icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white70,),) ,
                //         //   ) ,
                //         // )
                //       ],
                //     ),
                //   ),

              // ],
             // )
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: OutlinedButton(
                      onPressed: () async {
                        await _handlePhotoUpload(Permission.storage);
                        selectImage();
                      },
                      child: Text('Choose Image'),
                    ),
                  ),
                ),
                Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 20,
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              children: <Widget>[
                                Image.file(
                                  File(imageList[index].path),
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: InkWell(
                                    child: Icon(
                                      Icons.remove_circle,
                                      size: 25,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        imageList.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),

            // Container(
            //   height: 150,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //   ),
            //     child: GridView.builder(
            //       shrinkWrap: true,
            //       itemCount: multipleImages.isEmpty ? 1: multipleImages.length,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 4),
            //       itemBuilder: (context,index)=>
            //           Container(
            //              decoration: BoxDecoration(
            //               color: Colors.white,
            //                borderRadius: BorderRadius.circular(5),
            //         ),
            //            child: multipleImages.isEmpty ? Text(""):Image.file(File(multipleImages[index].path),fit: BoxFit.fill,),
            //       ),
            //     ),
            //
            // ),
           Padding(
               padding: EdgeInsets.all(10),
               child: Text("Basic Information",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Enter product Name',
                ),
                controller: productNameController,
                  validator: (productNameController)=>
                  productNameController!= null && productNameController.isEmpty ?
                  "Enter product name"
                      :null
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: DropdownButtonFormField(
                      hint: Text("Category"),
                      value: widget.update? widget.categoryId : categoryValue,
                      isExpanded: true,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none
                        ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: catData.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["cat_languages"][0]["title"]),
                          value: item["cat_languages"][0]["category_id"],
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          categoryValue = newValue!;
                        });
                      },
                        validator: (categoryValue)=>
                        categoryValue!= null && categoryValue == 0?
                        "Select category"
                            :null
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: DropdownButtonFormField(
                      hint: Text("Brand"),
                      value: widget.update? widget.brandId : brandValue,
                      isExpanded: true,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none
                        ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: brandData.map((item) {
                        return DropdownMenuItem(
                          child: Text(item["current_language"][0]["title"]),
                          value: item["current_language"][0]["brand_id"],
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          brandValue = newValue!;
                        });
                      },
                        validator: (brandValue)=>
                        brandValue!= null && brandValue == 0?
                        "Select brand"
                            :null
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Tags',
                ),
                controller: tagController,
                  validator: (tagController)=>
                  tagController!= null && tagController.isEmpty ?
                  "Enter tag"
                      :null
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Enter Slug',
                ),
                controller: slugController,
                  validator: (slugController)=>
                  slugController!= null && slugController.isEmpty ?
                  "Enter tag"
                      :null
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Stock',
                    ),
                    controller: stockController,
                      validator: (stockController)=>
                      stockController!= null && stockController.isEmpty ?
                      "Enter stock"
                          :null
                  ),
                ),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Unit',
                    ),
                    controller: unitController,
                      validator: (unitController)=>
                      unitController!= null && unitController.isEmpty ?
                      "Enter unit"
                          :null
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Unit Price',
                    ),
                    controller: unitPriceController,
                      validator: (unitPriceController)=>
                      unitPriceController!= null && unitPriceController.isEmpty ?
                      "Enter price"
                          :null
                  ),
                ),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Minimum Order',
                    ),
                    controller: minimumOrderController,
                      validator: (minimumOrderController)=>
                      minimumOrderController!= null && minimumOrderController.isEmpty ?
                      "Enter order number"
                          :null
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    labelText: 'Product Description',// <-- SEE HERE
                  ),
                  maxLines: 5, // <-- SEE HERE
                  minLines: 1,
                    // validator: (minimumOrderController)=>
                    // minimumOrderController!= null && minimumOrderController.isEmpty ?
                    // "Enter order number"
                    //     :null
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Short Description',
                ),
                controller: shortDesController,
                  validator: (shortDesController)=>
                  shortDesController!= null && shortDesController.isEmpty ?
                  "Short Description"
                      :null
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Enter sku',
                ),
                controller: skuController,
                  validator: (skuController)=>
                  skuController!= null && skuController.isEmpty ?
                  "Unique sku"
                      :null
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(10),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //         // width: 0.0 produces a thin "hairline" border
            //         borderSide:  BorderSide(color: Colors.grey, width: 1.0),
            //       ),
            //       border: OutlineInputBorder(),
            //       labelText: 'Enter status',
            //     ),
            //     controller: statusController,
            //       validator: (statusController)=>
            //       statusController!= null && statusController.isEmpty ?
            //       "Enter Status"
            //           :null
            //   ),
            // ),
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
                    border: Border.all(color: Colors.black38),
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
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Discount Amount',
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
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black54),
                  labelText: "Discount Period",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
           Container(
           width: 180,
           padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
           decoration: BoxDecoration(
           border: Border.all(color: Colors.black12),
           borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text("More Information",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
             IconButton(
                 icon: Icon(iconChange ? Icons.arrow_drop_up:Icons.arrow_drop_down_outlined,
                   size: 30,
                   color: textColor,),
                 onPressed: () {
                   // Setting the state
                   setState(() {
                     iconChange = !iconChange;
                     isVisibility = !isVisibility;
                   });
                 }),

             ],
           ),
      ),
            SizedBox(
              height: 10,
            ),

            Visibility(
              visible: isVisibility,
              // maintainSize: true,
              // maintainAnimation: true,
              // maintainState: true,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black26),
                        labelText: "Bar code ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black26),
                        labelText: "Long Description",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black26),
                        labelText: "Pdf url",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black26),
                        labelText: "video url",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black26),
                        labelText: "sku",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black26),
                        labelText: "Meta Title",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Colors.black26),
                        labelText: "Discount Period",
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
              ),
      ),
    );
  }

  /// Get from gallery
  // void _openGallery(BuildContext context) async{
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery ,
  //   );
  //   setState(() {
  //     imageFile = pickedFile!;
  //     storedImage = File(imageFile!.path);
  //     print(imageFile);
  //   });
  //
  //   Navigator.pop(context);
  // }
  //
  // void _openCamera(BuildContext context)  async{
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera ,
  //   );
  //   setState(() {
  //     imageFile = pickedFile!;
  //    storedImage = File(imageFile!.path);
  //   });
  //   Navigator.pop(context);
  // }

  // void _openImageMulti(BuildContext context)  async{
  //   List<XFile>? picked = await _picker.pickMultiImage();
  //   setState(() {
  //     multipleImages = picked!.map((e) => File(e.path)).toList();
  //   });
  //  // Navigator.pop(context);
  // }
  Future<void> _handlePhotoUpload(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  void selectImage() async {
    final XFile? selectedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      imageList.add(selectedImage);
      _imageNameList.add(selectedImage.name);
    }
    print('aksfhksalhfqxiwghfoewrhig');
    print(_imageNameList);
    setState(() {});
  }
}

