
//   import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// Future<UserCredential> signInWithFacebook() async {

//     final LoginResult result = await FacebookAuth.instance.login(permissions:['email']);


//     if (result.status == LoginStatus.success) {

//       final userData = await FacebookAuth.instance.getUserData();

//       _userData = userData;
//     } else {
//       print(result.message);
//     }

//     setState(() {
//       welcome = _userData?['email'];
//     });


//     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

//     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//   }