  import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/ProductView.dart';

import '../entities/Product.dart';

class ProductCreate extends StatefulWidget {
  final PMController pmController;

  const ProductCreate({Key? key, required this.pmController}) : super(key: key);

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }

  @override
  _ProductCreate createState() => _ProductCreate(pmController);
}

class _ProductCreate extends State<ProductCreate> {
  late String _id, _name;
  late double _price;

  PMController pmController;

  _ProductCreate(this.pmController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'What id', labelText: 'Id'),
              onChanged: (String value) {
                setState(() {
                  _id = value;
                });
              },
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: 'What Title', labelText: 'Title'),
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: 'What Price', labelText: 'Price'),
              onChanged: (String value) {
                setState(() {
                  _price = double.parse(value);
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  var p = Product(id: _id, name: _name, price: _price);
                  pmController.addProduct(p);
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProductView(pmController: pmController)));
                },
                child: Text('Submit'))
          ],
        ),
      ),
    ));
  }
}
