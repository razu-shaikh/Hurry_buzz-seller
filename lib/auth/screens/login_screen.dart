import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/auth_model.dart';
import 'package:ecommerce_app/auth/components/under_part.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:ecommerce_app/screen/FirstScreen/first_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Auth? authData ;
  String? _token;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    setState(() {
      _loading = value;
    });
  }

  Future<void> logIn(String email, String password) async{
    print(email+password);
    setLoading(true);
    try {
      Response response = await Dio().post('https://hurrybuzz.com/api/v1/seller/login',
        options: Options(
          headers: {
            "apiKey": "sdfdge544364dg#"},),
        data: {
          "email": email,
          "password": password
        },
      );
      Map<String,dynamic> authDataList= response.data;
      print(response.statusCode);

      if(response.statusCode == 200){
        // _dashboardData.clear();
        authData = Auth.fromJson(authDataList);
        print(authData!.toJson());
        _token = authData!.data!.token;
        print(_token);

        setLoading(false);
      }
    } catch (e) {
      print(e.toString);
      setLoading(false);
    }
  }
  String? get token {
    return _token;
  }


  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // late final AuthProvider authProvider;
  //
  // Future<void> initialize() async {
  //   authProvider = Provider.of<AuthProvider>(context,listen: false);
  //   await authProvider.token;
  //
  //   setState(() {
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  bool passObscure= true;
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
          appBar: AppBar(
            title: Text("LogIn",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, ),),
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
                    padding: const EdgeInsets.only(top: 100.0),
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
                          iconButton(context),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            //autovalidateMode: AutovalidateMode.onUserInteraction,
                            key: formKey,
                            child: Column(
                              children: [
                                TextFieldContainer(
                                    child: TextFormField(
                                    cursorColor: Colors.black54,
                                     decoration: InputDecoration(
                                     icon: Icon(
                                       Icons.email,color: Colors.black26,
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
                                       cursorColor: Colors.black54,
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
                                InkWell(
                                  onTap: () async{
                                    final isValidForm = formKey.currentState!.validate();
                                    await logIn(emailController.text.toString(),
                                        passwordController.text.toString());
                                       //print(authProvider.token);
                                      await setToken(token);

                                    if(isValidForm){
                                      token == null? Fluttertoast.showToast(msg: "email or pass incorrect !!"):
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => MyNavigationBar())
                                      );
                                    }

                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 40,right: 40,top:10),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child:loading? CircularProgressIndicator(color:Colors.white):
                                        Text("LogIn",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
                                          )),
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
                                        MaterialPageRoute(builder: (context) =>SignUpScreen())  //
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
      ),
    );
  }
  Future<void> setToken(token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);

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