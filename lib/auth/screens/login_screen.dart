import 'package:ecommerce_app/Provider/auth_provider.dart';
import 'package:ecommerce_app/auth/components/page_title_bar.dart';
import 'package:ecommerce_app/auth/components/under_part.dart';
import 'package:ecommerce_app/auth/components/upside.dart';
import 'package:ecommerce_app/auth/widgets/rounded_button.dart';
import 'package:ecommerce_app/auth/widgets/rounded_input_field.dart';
import 'package:ecommerce_app/auth/widgets/rounded_password_field.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("LogIn"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/login.PNG",
                ),
                const PageTitleBar(title: 'Login to your account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
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
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              TextFieldContainer(
                                  child: TextFormField(
                                  cursorColor: kPrimaryColor,
                                   decoration: InputDecoration(
                                   icon: Icon(
                                     Icons.person,color: Colors.black54,
                                ),
                                hintText: "Email",
                                hintStyle: const TextStyle(fontFamily: 'OpenSans'),
                                border: InputBorder.none),
                                    controller: emailController,),
                        ),

                            TextFieldContainer(
                                child: TextFormField(
                                     obscureText: true,
                                     cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                     Icons.lock,
                                       color: Colors.black54,
                                   ),
                                   hintText: "Password",
                                     hintStyle:  TextStyle(fontFamily: 'OpenSans'),
                                    suffixIcon: Icon(
                                   Icons.visibility,
                                 color: Colors.black54,
                            ),
                            border: InputBorder.none),
                                  controller: passwordController,
                      ),
                    ),
                              switchListTile(),
                              InkWell(
                                onTap: (){
                                  authProvider.logIn(emailController.text.toString(),
                                      passwordController.text.toString());
                                  authProvider.logInsuccess? Fluttertoast.showToast(msg: "email or pass incorrect !!"):
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => MyNavigationBar())
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 40,right: 40),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child:authProvider.loading? CircularProgressIndicator(color:Colors.white):
                                      Text("LogIn",style: TextStyle(fontSize: 20,color:Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const SignUpScreen())
                                  );
                                },
                              ),
                              const SizedBox(height: 50,)
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

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: kPrimaryColor,
      onChanged: (val) {},
    ),
  );
}

iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
     // RoundedIcon(imageUrl: "assets/images/facebook.png"),
      SizedBox(
        width: 20,
      ),
      //RoundedIcon(imageUrl: "assets/images/twitter.png"),
      SizedBox(
        width: 20,
      ),
     // RoundedIcon(imageUrl: "assets/images/google.jpg"),
    ],
  );
}