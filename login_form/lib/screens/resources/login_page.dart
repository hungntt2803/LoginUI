import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_form/controllers/login_controller.dart';
import 'package:login_form/screens/resources/home_page.dart';
import 'package:login_form/screens/resources/sign_in_page.dart';

//import facebook login
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //facebook login
  Map<String, dynamic>? _userData;
  String welcome = "Facebook";

  //login goole
  final controller = Get.put(LoginController());

  //Login Function user password
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found fot that email");
      }
    }
    return user;
  }

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
                const Text(
                  "Đăng nhập",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent),
                ),
                const Text("Sử dụng tài khoản Google của bạn",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow)),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _emailController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.redAccent,
                        ),
                        hintText: "Nhap username cua ban",
                        hintStyle: TextStyle(color: Colors.amberAccent),
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.redAccent)),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        fillColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.redAccent,
                        ),
                        hintText: "Nhap password cua ban",
                        hintStyle: TextStyle(color: Colors.amberAccent),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.redAccent)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 250),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 11,
                            fontStyle: FontStyle.italic),
                      )),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent)),
                    onPressed: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => HomePage()));
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    child: const Text("Login")),

                //Login With Google Account
                Obx(() {
                  if (controller.googleAccount.value == null) {
                    return buildLoginButton();
                  } else
                    return buildProfileView();
                }),

                TextButton(
                    onPressed: () {
                      signInWithFacebook();
                    },
                    child: Text(welcome))
              ],
            ),
          )),
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      label: Text(
        "Login with Google",
        style: TextStyle(color: Colors.black),
      ),
      icon: Image(
        image: AssetImage("assets/google_logo.jpg"),
        width: 30,
        height: 30,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  Widget buildProfileView() {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value?.photoUrl ?? "")
                  .image,
          radius: 100,
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline5,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1,
        ),

        //Logout Google Account
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              controller.logout();
            })
      ],
    );
  }

  //facebook Login
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result =
        await FacebookAuth.instance.login(permissions: ['email']);

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();

      _userData = userData;
    } else {
      print(result.message);
    }

    setState(() {
      welcome = _userData?['email'];
    });

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
