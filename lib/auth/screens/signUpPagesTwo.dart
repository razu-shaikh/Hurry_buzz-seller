import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/registration_model.dart';
import 'package:ecommerce_app/auth/components/under_part.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

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

  String shopTypeValue = 'Shop Type';
  String stateTypeValue = 'State';
  String cityTypeValue = 'City';
  String townTypeValue = 'Town';
  var itemsShopType = [
    'Shop Type',
    '10',
    '12',
    '14',
    'Item 5',
  ];
  var itemsState = [
    'State',
    '10',
    '20',
    '30',
    'Item 5',
  ];
  var itemsCity = [
    'City',
    '10',
    '20',
    '25',
    'Item 5',
  ];
  var itemsTown = [
    'Town',
    '10',
    '20',
    '40',
    'Item 5',
  ];
  Registration? registrationData;

  String? _token;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }
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
      String logo,
      String banner
      ) async{
    print(email+password+firstName+lastName+accountType+phone+shopName+slug+address+latitude+longitude+shop_type_id+state_id+city_id+town_id);
    setLoading(true);
    try{
      final response = await Dio().post('https://hurrybuzz.com/api/v1/seller/register',
        options: Options(
          headers: {"apiKey": "sdfdge544364dg#"},
        ),
        data: {
          "email": email,
          "password": password,
          "first_name":firstName,
          "last_name":lastName,
          "account_type":accountType,
          "phone":phone,
          "shop_name":shopName,
          "slug":slug,
          "address":address,
          "latitude":latitude,
          "longitude":longitude,
          "shop_type_id":shop_type_id, //must be a number
          "state_id":state_id,//must be a number
          "city_id":city_id,//must be a number
          "town_id":town_id,//must be a number
          "logo":logo,
          "banner":banner
        },
      );
      Map<String,dynamic> authDataList= response.data;
        if(response.statusCode == 200){
          registrationData = Registration.fromJson(authDataList);
          _token = registrationData!.data!.token;
          print(_token);

        }

    }
    catch(e){
      print(e.toString);
      setLoading(false);

    }

  }
  String? get token {
    return _token;
  }

  @override
  void initState() {
    setLoading(false);
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
          title: Text("Sign Up",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
          ),),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
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
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color:Colors.black26,width: 1)
                                ),
                                child: //ShopTypeDropDown(),
                                DropdownButton(
                                  underline: SizedBox(),
                                  value: shopTypeValue,
                                  isExpanded: true,
                                  iconSize: 36,
                                  hint: Text("Shop Type"),
                                  icon: const Icon(Icons.arrow_drop_down_outlined),
                                  items: itemsShopType.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      shopTypeValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFieldContainer(
                                child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: InputDecoration(
                                        hintText: "Shop Logo",
                                        border: InputBorder.none),
                                    controller: logoController,
                                    // validator: (emailController)=>
                                    // emailController!= null && !EmailValidator.validate(emailController)?
                                    // "Enter Valid Email"
                                    //     :null
                                ),
                              ),

                              TextFieldContainer(
                                child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: InputDecoration(
                                        hintText: "Shop banner",
                                        border: InputBorder.none),
                                    controller: bannerController,
                                    // validator: (phoneController)=>
                                    // phoneController!= null?
                                    // "Enter phone number"
                                    //     :null
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color:Colors.black26,width: 1)
                                ),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  value: stateTypeValue,
                                  isExpanded: true,
                                  iconSize: 36,
                                  hint: Text("State"),
                                  icon: const Icon(Icons.arrow_drop_down_outlined),
                                  items: itemsState.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      stateTypeValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color:Colors.black26,width: 1)
                                ),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  value: cityTypeValue,
                                  isExpanded: true,
                                  iconSize: 36,
                                  hint: Text("City"),
                                  icon: const Icon(Icons.arrow_drop_down_outlined),
                                  items: itemsCity.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      cityTypeValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: size.width *0.8,
                                padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color:Colors.black26,width: 1)
                                ),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  value: townTypeValue,
                                  isExpanded: true,
                                  iconSize: 36,
                                  hint: Text("Town"),
                                  icon: const Icon(Icons.arrow_drop_down_outlined),
                                  items: itemsTown.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      townTypeValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFieldContainer(
                                child: TextFormField(
                                  cursorColor: Colors.black26,
                                  decoration: InputDecoration(
                                      hintText: "Latitude",
                                      border: InputBorder.none),
                                  controller: latController,
                                  validator: (latController)=>
                                  latController!= null && latController.isEmpty?
                                  "Enter Latitude"
                                      :null
                                ),
                              ),
                              TextFieldContainer(
                                child: TextFormField(
                                  cursorColor: Colors.black26,
                                  decoration: InputDecoration(
                                      hintText: "Longitude",
                                      border: InputBorder.none),
                                  controller: lonController,
                                  validator: (lonController)=>
                                  lonController!= null && lonController.isEmpty?
                                  "Enter Longitude"
                                      :null
                                ),
                              ),
                              InkWell(
                                onTap: () async{
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
                                      shopTypeValue,
                                      stateTypeValue,
                                      cityTypeValue,
                                      townTypeValue,
                                      logoController.text.toString(),
                                      bannerController.text.toString(),
                                  );
                                  token == null ? Fluttertoast.showToast(msg: "Fill Up correctly !!"):
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => LoginScreen())
                                  );
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
}