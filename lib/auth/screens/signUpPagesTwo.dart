import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/Model/registration_model.dart';
import 'package:ecommerce_app/auth/components/under_part.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;


class SignUpScreenTwo extends StatefulWidget {
  //const SignUpScreenTwo({Key? key}) : super(key: key);
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String accountType;

  const SignUpScreenTwo(this.firstName, this.lastName,this.email,this.password,this.phone,this.accountType, {Key? key}) : super(key: key);

  @override
  State<SignUpScreenTwo> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreenTwo> {
  final formKey = GlobalKey<FormState>();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController userShopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  TextEditingController bannerController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();
  bool passObscure= true;

  var shopSelection;
  var stateSelection;
  var citySelection;
  var townSelection;
  //shop
  final String url = "https://hurrybuzz.com/api/v1/seller/";
  //List shopData = [];
  List<dynamic>? shopData;//edited line
  Future<void> getSWDataShop() async {
    var res = await http
        .post(Uri.parse(url+"shop_types"),
        headers: {"apiKey": "sdfdge544364dg#"});
    Map<String, dynamic> map = json.decode(res.body);
    setState(() {
      shopData = map["shop-types"];
    });
    //return "Sucess";
  }

  //List stateData = [];
  List<dynamic>? stateData =[];//edited line
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
  List<dynamic>? cityData = [];//edited line
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
  List<dynamic>? townData = [];//edited line
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
  Registration? registrationData;

  int? statusCode;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    setState(() {
      _loading = value;
    });

  }
  PickedFile? imageFile ;
  File? storedImage ;
  File? storedImageBanner ;

  Future<void> signUp(
      String email,
      String password,
      String firstName,
      String lastName,
      String accountType,
      String phone,
      String shopName,
      String slug,    //shop user name
      String address,
      String latitude,
      String longitude,
      String shop_type_id,
      String state_id,
      String city_id,
      String town_id,
      File storedImage,
      File storedImageBanner,
      ) async{
    print(email+password+firstName+lastName+accountType+phone+shopName+slug+address+latitude+longitude+shop_type_id+state_id+city_id+town_id);
    setLoading(true);
    Uri uri = Uri.parse("https://hurrybuzz.com/api/v1/seller/register");
    var request = http.MultipartRequest("POST", uri);
    Map<String, String> headers = {
      "apiKey": "sdfdge544364dg#",
    };
    request.headers.addAll(headers);

    var stream = http.ByteStream(storedImage.openRead());
        stream.cast();
    var length = await storedImage.length();
    var multipartFile =  http.MultipartFile('logo', stream, length, filename: storedImage.path);

    var streamBanner = http.ByteStream(storedImageBanner.openRead());
    streamBanner.cast();
    var lengthBanner = await storedImageBanner.length();
    var multipartFileBanner =  http.MultipartFile('banner', streamBanner, lengthBanner, filename: storedImageBanner.path);

    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['account_type'] = accountType;
    request.fields['phone'] = phone;
    request.fields['shop_name'] = shopName;
    request.fields['slug'] = slug;
    request.fields['address'] = address;
    request.fields['latitude'] = latitude;
    request.fields['longitude'] = longitude;
    request.fields['shop_type_id'] = shop_type_id;
    request.fields['state_id'] = state_id;
    request.fields['city_id'] = city_id;
    request.fields['town_id'] = town_id;
    request.files.add(multipartFile);
    request.files.add(multipartFileBanner);

    var response = await request.send();
    print(response.statusCode);
    statusCode = response.statusCode;
    setLoading(false);

    // response.stream.transform(utf8.decoder).listen((value) {
    //   Fluttertoast.showToast(msg: value,
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 2,
    //       backgroundColor: Colors.grey,
    //       textColor: Colors.white,
    //       fontSize: 15);
    //   //print(value);
    // });
  }
  @override
  void initState() {
    setLoading(false);
    getSWDataShop();
    getSWDataState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign Up",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
                      ),),

                    ],
                  )

                ],
              )

            ],
          ) ,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      "assets/images/login.PNG",
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Shop Information",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFieldContainer(
                                child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: InputDecoration(
                                        hintText: "Shop Name",
                                        border: InputBorder.none),
                                    controller: shopNameController,
                                    validator: (shopNameController)=>
                                    shopNameController!= null && shopNameController.isEmpty ?
                                    "Enter Shop Name"
                                        :null
                                ),
                              ),

                              TextFieldContainer(   //use slug
                                child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: const InputDecoration(
                                        hintText: "Shop UserName",
                                        border: InputBorder.none),
                                    controller: userShopNameController,
                                    validator: (userShopNameController)=>
                                    userShopNameController!= null && userShopNameController.isEmpty ?
                                    "Enter shop User name"
                                        :null

                                ),
                              ),
                              TextFieldContainer(   //use slug
                                child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: const InputDecoration(
                                        hintText: "Address",
                                        border: InputBorder.none),
                                    controller: addressController,
                                    validator: (addressController)=>
                                    addressController!= null && addressController.isEmpty ?
                                    "Enter Address"
                                        :null

                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 55,
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12 ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  items: shopData?.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item['name']),
                                      value: item['id'],
                                    );
                                  }).toList(),
                                  onChanged: ( newVal) {
                                    setState(() {
                                      shopSelection = newVal;
                                    });
                                  },
                                  value: shopSelection,
                                    validator: (shopSelection)=>
                                    shopSelection!= null && shopSelection == 0?
                                    "Select shop Type"
                                        :null
                                ),

                              ),
                              SizedBox(height: 10),
                              // TextFieldContainer(
                              //   child: TextFormField(
                              //       cursorColor: Colors.black26,
                              //       decoration: InputDecoration(
                              //           hintText: "Shop Logo",
                              //           border: InputBorder.none),
                              //       controller: logoController,
                              //       // validator: (emailController)=>
                              //       // emailController!= null && !EmailValidator.validate(emailController)?
                              //       // "Enter Valid Email"
                              //       //     :null
                              //   ),
                              // ),

                              // TextFieldContainer(
                              //   child: TextFormField(
                              //       cursorColor: Colors.black26,
                              //       decoration: InputDecoration(
                              //           hintText: "Shop banner",
                              //           border: InputBorder.none),
                              //       controller: bannerController,
                              //       // validator: (phoneController)=>
                              //       // phoneController!= null?
                              //       // "Enter phone number"
                              //       //     :null
                              //   ),
                              // ),
                              Container(
                                height: 55,
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  items: stateData?.map((item) {
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
                                  value: stateSelection,
                                    validator: (stateSelection)=>
                                    stateSelection!= null && stateSelection == 0?
                                    "Select state"
                                        :null
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 55,
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12 ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  items: cityData?.map((item) {
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
                                  value: citySelection,
                                    validator: (citySelection)=>
                                    citySelection!= null && citySelection == 0?
                                    "Select city"
                                        :null
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 55,
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12 ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  items: townData?.map((item) {
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
                                  value: townSelection,
                                    validator: (townSelection)=>
                                    townSelection!= null && townSelection == 0?
                                    "Select city"
                                        :null
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFieldContainer(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Shop Logo",style: TextStyle(fontSize: 16,color: Colors.black54),),
                                    IconButton(
                                        onPressed:(){
                                          _showChoiceDialog(context,1);
                                        },
                                        icon:Icon(Icons.image))

                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ( storedImage == null)?Text(""):Image.file(
                                  File(storedImage!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              TextFieldContainer(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Shop Banner",style: TextStyle(fontSize: 16,color: Colors.black54)),
                                    IconButton(
                                        onPressed:(){
                                          _showChoiceDialog(context,2);
                                        },
                                        icon:Icon(Icons.image))

                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ( storedImageBanner == null)?Text(""):Image.file(
                                  File(storedImageBanner!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // TextFieldContainer(
                              //   child: TextFormField(
                              //     cursorColor: Colors.black26,
                              //     decoration: InputDecoration(
                              //         hintText: "Latitude",
                              //         border: InputBorder.none),
                              //     controller: latController,
                              //     validator: (latController)=>
                              //     latController!= null && latController.isEmpty?
                              //     "Enter Latitude"
                              //         :null
                              //   ),
                              // ),
                              // TextFieldContainer(
                              //   child: TextFormField(
                              //     cursorColor: Colors.black26,
                              //     decoration: InputDecoration(
                              //         hintText: "Longitude",
                              //         border: InputBorder.none),
                              //     controller: lonController,
                              //     validator: (lonController)=>
                              //     lonController!= null && lonController.isEmpty?
                              //     "Enter Longitude"
                              //         :null
                              //   ),
                              // ),
                              InkWell(
                                onTap: () async{
                                  final isValidForm = formKey.currentState!.validate();
                                  if(isValidForm){
                                  await signUp(
                                      widget.email,
                                      widget.password,
                                      widget.firstName,
                                      widget.lastName,
                                      widget.accountType,
                                      widget.phone,
                                      shopNameController.text.toString(),
                                      userShopNameController.text.toString(),  //slug
                                      addressController.text.toString(),
                                      latController.text.toString(),
                                      lonController.text.toString(),
                                      shopSelection.toString(),
                                      stateSelection.toString(),
                                      citySelection.toString(),
                                      townSelection.toString(),
                                      storedImage!,
                                      storedImageBanner!
                                  );

                                  statusCode != 200? Fluttertoast.showToast(msg: "Fill Up correctly !!"):
                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (context) => LoginScreen())
                                   );
                                 }

                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 40,right: 40,top: 10),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child:loading? CircularProgressIndicator(color:Colors.white):
                                      Text("SignUp",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              // RoundedButton(text: 'REGISTER', press: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const LoginScreen())
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


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
                  _openGallery(context, value);
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

/// Get from gallery
void _openGallery(BuildContext context, int value) async{
  final pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery ,
  );
  setState(() {
    imageFile = pickedFile!;
    if(value==1){
      storedImage = File(imageFile!.path);
    }else if(value==2){
      storedImageBanner = File(imageFile!.path);
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
      storedImage = File(imageFile!.path);
    }else if(value==2){
      storedImageBanner = File(imageFile!.path);
    }

  });
  Navigator.pop(context);
}
}