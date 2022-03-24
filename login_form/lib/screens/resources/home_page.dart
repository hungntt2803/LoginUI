import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: buildProfileView(),
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
            }),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Back"))
      ],
    );
  }
}
