import 'package:flutter/material.dart';

enum Product {
  // ignore: constant_identifier_names
  Dart(
      imageUrl: "assets/product/dart.jpg",
      title: 'Dart',
      description: "This is dart"),
  // ignore: constant_identifier_names
  Flutter(
      imageUrl: "assets/product/flutter2.png",
      title: 'Flutter',
      description: "This is dart"),
  // ignore: constant_identifier_names
  Firebase(
      imageUrl: "assets/product/firebase.png",
      title: 'Firebase',
      description: "This is dart");

  final String imageUrl;
  final String title;
  final String description;
  const Product(
      {required this.imageUrl, required this.title, required this.description});
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required Product product}) : _product = product;

  final Product _product;

  String get cardImage => _product.imageUrl;
  String get cardTitle => _product.title;
  String get cardDescription => _product.description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(cardImage, width: 100, height: 100),
                Text(cardTitle),
                Text(cardDescription)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(
      title: const Text(
        'Products',
        selectionColor: Color(0xFF000000),
        style: TextStyle(fontSize: 15),
      ),
      backgroundColor: Colors.white,
    ),
    body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductCard(product: Product.Dart),
            ProductCard(product: Product.Flutter),
            ProductCard(product: Product.Firebase)
          ],
        )),
  )));
}
