import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:ecommerce_app/screen/shop/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../notification/notification.dart';

class UpdateShop extends StatefulWidget {
  String logo;
  String banner;
  String phoneNumber;
  String shopName;
  String slug;
  String address;
  String lat;
  String lon;
  var shopTypeId;
  var stateId;
  var cityId;
  var townId;
  String metaTitle;
  String metaDescription;
  String licenseNo;
  UpdateShop(
      this.logo,
      this.banner,
      this.phoneNumber,
      this.shopName,
      this.slug,
      this.address,
      this.lat,
      this.lon,
      this.shopTypeId,
      this.stateId,
      this.cityId,
      this.townId,
      this.metaTitle,
      this.metaDescription,
      this.licenseNo,
      {Key? key}) : super(key: key);

  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

class _AddDeliverAddressState extends State<UpdateShop> {
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController shopController = TextEditingController();
  TextEditingController slugController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();
  TextEditingController metaController = TextEditingController();
  TextEditingController metaDescriptionController = TextEditingController();
  TextEditingController licenseController = TextEditingController();

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
  var  storedImage;
  var storedImageBanner ;

  final ImagePicker _picker = ImagePicker();

  var shopSelection ;
  var stateSelection;
  var citySelection;
  var townSelection;
  //shop


  Future<void>_showChoiceDialog(BuildContext context, int value)
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
                  _openGallery(context,value);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context,value);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),
      );
    });
    }

  Future<String?> addData(
      String phoneNumber,
      String shopName ,
      String slug,
      String address,
      String lat,
      String lon,
      var shopTypeId,
      var stateId,
      var cityId,
      var townId,
      String metaTitle,
      String metaDescription,
      String licenseNo,
      var storedImage,
      var storedImageBanner,) async {
    setLoading(true);
    print("click");

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");

    var uri = Uri.parse("https://hurrybuzz.com/api/v1/seller/shop/update");

    var request = http.MultipartRequest("POST", uri);

    Map<String, String> headers = {
      "apiKey": "sdfdge544364dg#",
      "Authorization": "Bearer $authToken"
    };
    request.headers.addAll(headers);
    var multipartFile;
    var multipartFileBanner;
    if(storedImage != null){
      var stream = http.ByteStream(storedImage.openRead());
      stream.cast();
      var length = await storedImage.length();
      multipartFile =  http.MultipartFile('logo', stream, length, filename: storedImage.path);

      var streamBanner = http.ByteStream(storedImageBanner.openRead());
      streamBanner.cast();
      var lengthBanner = await storedImageBanner.length();
      multipartFileBanner =  http.MultipartFile('banner', streamBanner, lengthBanner, filename: storedImageBanner.path);
    }
    // ignore this headers if there is no authentication

//adding params
    request.fields['phone_no'] = phoneNumber;
    request.fields['shop_name'] = shopName;
    request.fields['slug'] = slug;
    request.fields['address'] = address;
    request.fields['latitude'] = lat;
    request.fields['longitude'] = lon;
    request.fields['shop_type_id'] = shopTypeId.toString();
    request.fields['state_id'] = stateId.toString();
    request.fields['city_id'] = cityId.toString();
    request.fields['town_id'] = townId.toString();
    request.fields['meta_title'] = metaTitle;
    // request.fields['special_discount'] = special_discount;
    // request.fields['special_discount_type'] = special_discount_type;
    // request.fields['special_discount_period'] = special_discount_period;
    request.fields['meta_description'] = metaDescription;
    request.fields['license_no'] = licenseNo;
    if(storedImage != null){
      request.files.add(multipartFile);
      request.files.add(multipartFileBanner);
    }

    // request.fields['status'] = status;

    var response = await request.send();

    print(response.statusCode);

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
    phoneNumberController.text = widget.phoneNumber;
    shopController.text = widget.shopName;
    slugController.text = widget.slug;
    addressController.text = widget.address;
    latController.text= widget.lat;
    lonController.text = widget.lon;
    // shopSelection = widget.shopTypeId;
    // stateSelection = widget.stateId;
    // citySelection = widget.cityId;
    // townSelection = widget.townId;
    metaController.text = widget.metaTitle;
    metaDescriptionController.text = widget.metaDescription;
    licenseController.text = widget.licenseNo;
    //print(shopSelection+stateSelection+citySelection+townSelection);
    getSWDataShop();
    getSWDataState();
    super.initState();
  }
  final String url = "https://hurrybuzz.com/api/v1/seller/";
  List<dynamic> shopData = [];//edited line
  Future<void> getSWDataShop() async {
    var res = await http.post(Uri.parse(url+"shop_types"),
        headers: {"apiKey": "sdfdge544364dg#"});
    Map<String, dynamic> map = json.decode(res.body);
    setState(() {
      shopData = map["shop-types"];
    });
    //return "Sucess";
  }

  //List stateData = [];
  List<dynamic> stateData = [];//edited line
  Future<void> getSWDataState() async {
    var res = await http
        .post(Uri.parse(url+"states"),
        headers: {"apiKey": "sdfdge544364dg#"});
    Map<String, dynamic> map = json.decode(res.body);
    setState(() {
      stateData = map["states"];
    });
    //return "Sucess";
  }
  // List cityData = [];
  List<dynamic>cityData = [];//edited line
  Future<void> getSWDataCity(var stateSelection) async {
    var res = await http
        .post(Uri.parse(url+"cities/by_state/"+stateSelection.toString()),
        headers: {"apiKey": "sdfdge544364dg#"});
    Map<String, dynamic> map = json.decode(res.body);
    setState(() {
      cityData = map["city"];
    });
    //return "Sucess";
  }
  //List townData = [];
  List<dynamic> townData = [];//edited line
  Future<void> getSWDataTown( var citySelection) async {
    var res = await http
        .post(Uri.parse(url+"towns/by_city/"+citySelection.toString()),
        headers: {"apiKey": "sdfdge544364dg#"});
    Map<String, dynamic> map = json.decode(res.body);

    setState(() {
      townData =  map["town"];
    });
    // return "Sucess";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("=================${widget.shopTypeId}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.red,
        title: Text(
          "Update",
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
              backgroundColor: Color(0xff1749e2),
              color: Colors.white,
              iconColor: Colors.white70,
              title:"Update",
              onTap: () async {
                SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green));
                final isValidForm = formKey.currentState!.validate();
                if(isValidForm){
                  await addData(
                    phoneNumberController.text.toString(),
                    shopController.text.toString(),
                    slugController.text.toString(),
                    addressController.text.toString(),
                    latController.text.toString(),
                    lonController.text.toString(),
                    shopSelection??widget.shopTypeId,
                    stateSelection??widget.stateId,
                    citySelection??widget.cityId,
                    townSelection??widget.townId,
                    metaController.text.toString(),
                    metaDescriptionController.text.toString(),
                    licenseController.text.toString(),
                    storedImage,
                    storedImageBanner,
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
                child:( storedImageBanner == null)?Text(""):Image.file(
                  File(storedImageBanner!.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xffd9ba1e),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(0),
                          child:( storedImage == null)?Text(""):Image.file(
                            File(storedImage!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.only(bottom: 10,top: 10,left: 40),
                      child: Row(
                        children: [
                          SizedBox(width: 6,),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child:Align(
                              alignment: Alignment.center,
                              child:IconButton(onPressed: (){
                                _showChoiceDialog(context,2);
                              },
                                icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white70,),) ,
                            ) ,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            Padding(
              padding:const EdgeInsets.only(bottom: 10,top: 10,left: 50),
              child: Row(
                children: [
                  SizedBox(width: 6,),
                  Padding(
                    padding: const EdgeInsets.only(left: 230,top: 80),
                    child:Align(
                      alignment: Alignment.center,
                      child:IconButton(onPressed: (){
                        _showChoiceDialog(context,1);
                      },
                        icon: Icon(Icons.add_circle_outline_sharp,size: 30,color: Colors.white70,),) ,
                    ) ,
                  )
                ],
              ),
            ),
              ],
        ),

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
                  labelText: 'Phone number',
                ),
                controller: phoneNumberController,
                  validator: (phoneNumberController)=>
                  phoneNumberController!= null && phoneNumberController.isEmpty ?
                  "Enter shop name"
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
                  labelText: 'shop Name',
                ),
                controller: shopController,
                  validator: (shopController)=>
                  shopController!= null && shopController.isEmpty ?
                  "Enter shop name"
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
                  labelText: 'address',
                ),
                controller: addressController,
                  validator: (addressController)=>
                  addressController!= null && addressController.isEmpty ?
                  "Enter address"
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
                  labelText: 'slug',

                ),
                controller: slugController,
                  validator: (slugController)=>
                  slugController!= null && slugController.isEmpty ?
                  "Enter slug"
                      :null
              ),
            ),
             Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: size.width *0.8,
                    padding: EdgeInsets.symmetric(horizontal:12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color:Colors.black26,width: 1)
                    ),
                    //child: ShopTypeDropDown(shopSelection),
                    child: DropdownButtonFormField(
                      hint: Text("Shop Type"),
                      isExpanded: true,
                      iconSize: 30,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none
                        ),
                      items: shopData.map((item) {
                        return DropdownMenuItem(
                          value: item['id'],
                          child: Text(item['name']),
                        );
                      }).toList(),
                      onChanged: ( newVal) {
                        setState(() {
                          shopSelection = newVal;
                          //print(shopSelection);
                        });
                      },
                      value: int.parse(widget.shopTypeId),
                        validator: (shopSelection)=>
                        shopSelection!= null && shopSelection == 0?
                        "Select shop"
                            :null
                    ),

                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 55,
                    width: size.width *0.8,
                    padding: EdgeInsets.symmetric(horizontal:12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color:Colors.black26,width: 1)
                    ),
                    // child:StateTypeDropDown(stateSelection),
                    child: DropdownButtonFormField(
                      hint: Text("Select State"),
                      isExpanded: true,
                      iconSize: 30,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none
                        ),
                      items: stateData.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['name']),
                          value: item['id'],
                        );
                      }).toList(),
                      onChanged: ( newVal) {
                        setState(() {
                          stateSelection = newVal;
                          getSWDataCity(stateSelection);
                        });
                      },
                      value: int.parse(widget.stateId),
                        validator: (stateSelection)=>
                        stateSelection!= null && stateSelection == 0?
                        "Select state"
                            :null
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 55,
                    width: size.width *0.8,
                    padding: EdgeInsets.symmetric(horizontal:12 ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color:Colors.black26,width: 1),
                    ),
                    //child: CityTypeDropDown(citySelection),
                    child: DropdownButtonFormField(
                      hint: Text("Select City "),
                      isExpanded: true,
                      iconSize: 30,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none
                        ),
                      items: cityData.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['name']),
                          value: item['id'],
                        );
                      }).toList(),
                      onChanged: ( newVal) {
                        setState(() {
                          citySelection = newVal;
                          getSWDataTown(citySelection);
                        });
                      },
                      value: int.parse(widget.cityId),
                        validator: (citySelection)=>
                        citySelection!= null && citySelection == 0?
                        "Select city"
                            :null
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: size.width *0.8,
                    padding: EdgeInsets.symmetric(horizontal:12 ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color:Colors.black26,width: 1)
                    ),
                    // child: TownTypeDropDown(townSelection),
                    child: DropdownButtonFormField(
                      hint: Text("Select Town"),
                      isExpanded: true,
                      iconSize: 30,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none
                        ),
                      items: townData.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['name']),
                          value: item['id'],
                        );
                      }).toList(),
                      onChanged: ( newVal) {
                        setState(() {
                          townSelection = newVal;
                        });
                      },
                      value: int.parse(widget.townId), // drop down a ata korte hoi.....
                        validator: (townSelection)=>
                        townSelection!= null && townSelection == 0?
                        "Select town"
                            :null
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Latitude Title',),
                        controller: latController,
                        validator: (latController)=>
                        latController!= null && latController.isEmpty?
                        "Enter Latitude"
                            :null
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Longitude",
                            ),
                        controller:lonController,
                        validator: (lonController)=>
                        lonController!= null && lonController.isEmpty?
                        "Enter Longitude"
                            :null
                    ),
                  ),

                ],
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
                    labelText: 'Meta Title',
                  ),
                  controller: metaController,
                    validator: (metaController)=>
                    metaController!= null && metaController.isEmpty ?
                    "Enter meta Title"
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
                    labelText: 'Description',
                  ),
                  controller: metaDescriptionController,
                    validator: (metaDescriptionController)=>
                    metaDescriptionController!= null && metaDescriptionController.isEmpty ?
                    "Enter Description"
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
                    labelText: 'License No',
                  ),
                  controller: licenseController,
                    validator: (licenseController)=>
                    licenseController!= null && licenseController.isEmpty ?
                    "Enter License"
                        :null
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

          ],
        ),
      ),
    );
  }

  /// Get from gallery
  void _openGallery(BuildContext context, int value) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      imageFile = pickedFile!;
      if(value==1){
        storedImageBanner = File(imageFile!.path);
      }else if(value==2){
        storedImage = File(imageFile!.path);
      }
      print(imageFile);
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context,int value)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      imageFile = pickedFile!;
      if(value==1){
        storedImageBanner = File(imageFile!.path);
      }else if(value==2){
        storedImage = File(imageFile!.path);
      }
    });
    Navigator.pop(context);
  }

}
