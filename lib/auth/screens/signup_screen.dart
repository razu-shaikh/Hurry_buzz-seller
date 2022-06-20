import 'package:ecommerce_app/Provider/signIn_provider.dart';
import 'package:ecommerce_app/auth/components/under_part.dart';
import 'package:ecommerce_app/auth/screens/signUpPagesTwo.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool passObscure= true;

  String dropdownvalue = 'Account Type';
  var items = [
    'Account Type',
    'Free',
    'Paid',
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   title: Text("Sign Up",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
          //   ),),
          //   automaticallyImplyLeading: false,
          //   backgroundColor: Colors.red,
          // ),
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
                            "Create Account",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "User Information",
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
                                        icon: Icon(
                                          Icons.person,
                                          color: Colors.black26,
                                        ),
                                        hintText: "First Name",
                                        border: InputBorder.none),
                                    controller: firstNameController,
                                      validator: (firstNameController)=>
                                      firstNameController != null && firstNameController.isEmpty?
                                          "Enter your name"
                                          :null
                                  ),
                                ),

                                TextFieldContainer(
                                  child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: const InputDecoration(
                                        icon: Icon(
                                          Icons.person,
                                          color: Colors.black26,
                                        ),
                                        hintText: "Last Name",
                                        border: InputBorder.none),
                                    controller: lastNameController,
                                      validator: (lastNameController)=>
                                      lastNameController!= null && lastNameController.isEmpty ?
                                      "Enter last name" :null

                                  ),
                                ),

                                TextFieldContainer(
                                  child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.email,
                                          color: Colors.black26,
                                        ),
                                        hintText: "Email",
                                        border: InputBorder.none),
                                    controller: emailController,
                                      validator: (emailController)=>
                                      emailController!= null && !EmailValidator.validate(emailController)?
                                      "Enter Valid Email"
                                          :null
                                  ),
                                ),

                                TextFieldContainer(
                                  child: TextFormField(
                                    obscureText: passObscure,
                                    cursorColor: Colors.black26,
                                    decoration:  InputDecoration(
                                        icon: Icon(
                                          Icons.lock,
                                          color: Colors.black26,
                                        ),
                                        hintText: "Password",
                                        suffixIcon:IconButton(
                                          onPressed:(){
                                            setState(() {
                                              passObscure = !passObscure;
                                            });
                                          },
                                          icon: Icon(
                                            passObscure? Icons.visibility_off:Icons.visibility,
                                            color: Colors.black26,
                                          ),),
                                        border: InputBorder.none),
                                    controller: passwordController,
                                      validator: (passwordController)=>
                                      passwordController!= null && passwordController.length < 6?
                                      "Enter minimum 6 characters"
                                          :null
                                  ),
                                ),
                                TextFieldContainer(
                                  child: TextFormField(
                                    cursorColor: Colors.black26,
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.phone,
                                          color: Colors.black26,
                                        ),
                                        hintText: "Phone Number",
                                        border: InputBorder.none),
                                    controller: phoneController,
                                      validator: (phoneController)=>
                                      phoneController!= null && phoneController.isEmpty?
                                      "Enter phone number"
                                          :null
                                  ),
                                ),

                                Container(
                                  width: size.width *0.8,
                                  padding: EdgeInsets.symmetric(horizontal:12 ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color:Colors.black26,width: 1)
                                  ),
                                  child: DropdownButton(
                                    focusColor: Colors.black26,
                                    value: dropdownvalue,
                                    isExpanded: true,
                                    iconSize: 36,
                                    icon: const Icon(Icons.arrow_drop_down_outlined),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                      // validator: (dropdownvalue)=>
                                      // dropdownvalue!= null && dropdownvalue == 0?
                                      // "Select account type"
                                      //     :null
                                  ),
                                ),

                                InkWell(
                                  onTap: () async{
                                    final isValidForm = formKey.currentState!.validate();
                                    if(isValidForm) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => SignUpScreenTwo(
                                              firstNameController.text.toString(),
                                              lastNameController.text.toString(),
                                              emailController.text.toString(),
                                              passwordController.text.toString(),
                                              phoneController.text.toString(),
                                              dropdownvalue))
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
                                        child:Text("Next",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
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
      ),
    );
  }
}