import 'package:ecommerce_app/Provider/signIn_provider.dart';
import 'package:ecommerce_app/auth/components/page_title_bar.dart';
import 'package:ecommerce_app/auth/components/under_part.dart';
import 'package:ecommerce_app/auth/components/upside.dart';
import 'package:ecommerce_app/auth/constants.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool passObscure= true;
  @override
  Widget build(BuildContext context) {
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
          automaticallyImplyLeading: false,
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
                          "Create Account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
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
                                  controller: firstNameController,),
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
                                  controller: emailController,),
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
                                  controller: phoneController,),
                              ),

                              TextFieldContainer(
                                child: TextFormField(
                                  cursorColor: Colors.black26,
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.shop,
                                        color: Colors.black26,
                                      ),
                                      hintText: "Shop Name",
                                      border: InputBorder.none),
                                  controller: shopNameController,
                                ),
                              ),

                              TextFieldContainer(
                                child: TextFormField(
                                  cursorColor: Colors.black26,
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.home_filled,
                                        color: Colors.black26,
                                      ),
                                      hintText: "Address",
                                      border: InputBorder.none),
                                  controller: addressController,
                                ),
                              ),
                              InkWell(
                                onTap: () async{
                                  await signInProvider.signUp(
                                      emailController.text.toString(),
                                      passwordController.text.toString(),
                                      firstNameController.text.toString(),
                                      lastNameController.text.toString(),
                                      phoneController.text.toString(),
                                      shopNameController.text.toString(),
                                      addressController.text.toString(),
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