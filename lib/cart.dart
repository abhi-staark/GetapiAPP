import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:getapiapp/Palletes/pallete.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Pallete.primarycolor,
        body: null,
      ),
    );
  }
}
