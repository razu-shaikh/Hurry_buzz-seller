import 'package:dio/dio.dart';
import 'package:ecommerce_app/Provider/signIn_provider.dart';
import 'package:ecommerce_app/auth/components/under_part.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

  // Future<void> shopType() async{
  //   try {
  //     Response response = await Dio().post('https://hurrybuzz.com/api/v1/seller/shop_types',
  //       options: Options(
  //         headers: {
  //           "apiKey": "sdfdge544364dg#"},),
  //     );
  //     Map<String,dynamic> authDataList= response.data;
  //     print(authDataList);
  //
  //     if(response.statusCode == 200){
  //
  //     }
  //   } catch (e) {
  //     print(e.toString);
  //   }
  //
  // }

  String shopTypeValue = '10';
  String stateTypeValue = '10';
  String cityTypeValue = '10';
  String townTypeValue = '10';
  var itemsShopType = [
    '10',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var itemsState = [
    '10',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var itemsCity = [
    '10',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var itemsTown = [
    '10',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {

    // print(widget.email);
    // print(widget.firstName);
    // print(widget.accountType);

    final signInProvider = Provider.of<SignInProvider>(context);
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
                                child: DropdownButton(
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
                                  await signInProvider.signUp(
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
                                  signInProvider.token == null ? Fluttertoast.showToast(msg: "Fill Up correctly !!"):
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
                                      child:signInProvider.loading? CircularProgressIndicator(color:Colors.white):
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