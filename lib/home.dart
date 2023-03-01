import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getapiapp/Palletes/pallete.dart';
import 'package:getapiapp/cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              toolbarHeight: 70,
              title: const Text("Easy Ecom"),
              backgroundColor: Pallete.primarycolor,
              actions: const [
                IconButton(
                    onPressed: null, icon: Icon(CupertinoIcons.heart_solid)),
              ]),
          bottomNavigationBar: BottomAppBar(
            color: Pallete.primarycolor,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: const Icon(CupertinoIcons.home)),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: const Icon(CupertinoIcons.cart)),
                  //IconButton(onPressed: null, icon: Icon(CupertinoIcons.home)),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: const Icon(CupertinoIcons
                          .person_crop_circle_fill_badge_checkmark)),
                ],
              ),
            ),
          )),
    );
  }
}
