import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _fullnameText = "";
  String _usernameText = "";
  String _passwordText = "";

  late TextEditingController _fullnameController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullnameController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullnameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
                Text(
                  "Đăng Ký",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent),
                ),
                Text("Tạo tài khoản mới",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        fillColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.person_pin_outlined,
                          color: Colors.redAccent,
                        ),
                        hintText: "Nhập họ và tên của bạn",
                        hintStyle: TextStyle(color: Colors.amberAccent),
                        labelText: 'Fullname',
                        labelStyle: TextStyle(color: Colors.redAccent)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _usernameController,
                    //obscureText: true,
                    decoration: InputDecoration(
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
                      labelStyle: TextStyle(color: Colors.redAccent),
                      // errorText: "Sai tên đăng nhập",
                      // helperText: "correct"
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
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
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                        fillColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.redAccent,
                        ),
                        hintText: "Nhập lại password",
                        hintStyle: TextStyle(color: Colors.amberAccent),
                        labelText: 'Retype Password',
                        labelStyle: TextStyle(color: Colors.redAccent)),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent)),
                    onPressed: () {
                      // setState(() {
                      //   _fullnameText = _fullnameController.text;
                      //   _usernameText = _usernameController.text;
                      //   _passwordText = _passwordController.text;
                      // });
                      Navigator.pop(context);
                    },
                    child: Text("Sign In")),
                // Text("Đây là tên của bạn: " + _fullnameText),
                // Text("Đây là username của bạn: " + _usernameText),
                // Text("Đây là password của bạn: " + _passwordText),
              ],
            ),
          )),
    );
  }
}
