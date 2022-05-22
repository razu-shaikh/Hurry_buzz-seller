import 'package:flutter/material.dart';
// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);
//
//   @override
//   _SignInState createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   late UserProvider userProvider;
//
//   Future<User?> _googleSignUp() async {
//     try {
//       final GoogleSignIn _googleSignIn = GoogleSignIn(
//         scopes: ['email'],
//       );
//       final FirebaseAuth _auth = FirebaseAuth.instance;
//       User? user;
//
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential = await _auth.signInWithCredential(credential);
//       // print("signed in " + user.displayName);
//       user = userCredential.user;
//       userProvider.addUserData(
//         currentUser: user!,
//         userEmail: user.email!,
//         userImage: user.photoURL!,
//         userName: user.displayName!,
//       );
//
//       return user;
//     } catch (e) {
//      // print(e.message);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     userProvider = Provider.of<UserProvider>(context);
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               fit: BoxFit.cover, image: AssetImage('assets/background.png')),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 400,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text('Sign in to contunue'),
//                   Text(
//                     'Vegi',
//                     style:
//                     TextStyle(fontSize: 50, color: Colors.white, shadows: [
//                       BoxShadow(
//                         blurRadius: 5,
//                         color: Colors.green.shade900,
//                         offset: Offset(3, 3),
//                       )
//                     ]),
//                   ),
//                   Column(
//                     children: [
//                       SignInButton(
//                         Buttons.Apple,
//                         text: "Sign in with Apple",
//                         onPressed: () {},
//                       ),
//                       SignInButton(
//                         Buttons.Google,
//                         text: "Sign in with Google",
//                         onPressed: () async {
//                           await _googleSignUp().then(
//                                 (value) => Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                 builder: (context) => MyNavigationBar(),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         'By signing in you are agreeing to our',
//                         style: TextStyle(
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                       Text(
//                         'Terms and Privacy Policy',
//                         style: TextStyle(
//                           color: Colors.grey[800],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }