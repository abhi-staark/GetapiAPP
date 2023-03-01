import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getapiapp/Palletes/pallete.dart';
import 'package:getapiapp/models/producstModel.dart';
import 'package:http/http.dart' as http;

//import 'http'
class ProductsHome extends StatefulWidget {
  const ProductsHome({super.key});

  @override
  State<ProductsHome> createState() => _ProductsHomeState();
}

//initializing a list to store api data
List<Products> productlist = [];

class _ProductsHomeState extends State<ProductsHome> {
  Future<List<Products>> getProductsApi() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print("ok till here");
      for (final i in data) {
        //print(i);
        productlist.add(Products.fromJson(i));
      }
      // print(productlist[image].length);
      return productlist;
    } else {
      return productlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
              onPressed: null,
              icon: Icon(CupertinoIcons.line_horizontal_3_decrease)),
          backgroundColor: Pallete.primarycolor,
          title: const Text("Easy Ecom"),
          actions: const [
            IconButton(onPressed: null, icon: Icon(CupertinoIcons.heart)),
            IconButton(onPressed: null, icon: Icon(CupertinoIcons.cart)),
            IconButton(onPressed: null, icon: Icon(CupertinoIcons.person_fill))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              child: FutureBuilder(
                future: getProductsApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading..!");
                  } else {
                    return ListView.builder(
                        itemCount: productlist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    productlist[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Rs" +
                                      productlist[index].price.toString()),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: productlist.length,
                                      itemBuilder: ((context, position) {
                                        return Padding(
                                          //child: Text(productlist[index].title),
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 10),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .75,
                                            decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    productlist[index].image),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  )
                                ]),
                          );
                        });
                  }
                },
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Pallete.primarycolor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.money_pound_circle),
                  label: "orders")
            ]),
      ),
    );
  }
}
