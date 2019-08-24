import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final String title;
  final List<dynamic> data;

  ProductsScreen({this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('$title', style: TextStyle(color: Colors.black, fontSize: 30.0)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Stack(children: <Widget>[
              Icon(Icons.shopping_cart, size: 45.0, color: Colors.black87),
              Positioned(
                
                right: 1.1,
                top: 1.0,
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                radius: 10.0,
                child: Text('6', style: TextStyle(color: Colors.white),)))
            ],),
          )
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView.builder(
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              String image = data[index]['imgPath'];
              String title = data[index]['name'];
              String cost = data[index]['cost'];
              return cardProduct(image, title, cost);
            },
          ),
        ),
      ),
    );
  }

  Widget cardProduct(String image, String title, String cost) {
    return Container(
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.all(10.0),
        child: Card(
            elevation: 5.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(image, fit:BoxFit.fill, height: 150.0,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cost, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                )
              ],
            )));

  }
}
