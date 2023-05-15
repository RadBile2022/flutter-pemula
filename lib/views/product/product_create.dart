import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/product/products_page.dart';
import 'package:flutterfoundation/views/tab_bar.dart';
import 'package:image_picker/image_picker.dart';


class ProductCreatePage extends StatefulWidget {
  // final PMController pmController;
  final ProductListPage child;

  const ProductCreatePage({Key? key, required this.child}) : super(key: key);

  @override
  _ProductCreatePage createState() => _ProductCreatePage();
}

class _ProductCreatePage extends State<ProductCreatePage> {

  late String _id, _name;
  late double _price;
  File? image;


  Future openCamera() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(pickedImage!.path);
    print(image.toString());
  }

  Future openGallery() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(pickedImage!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Padding(
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
              image != null ? ClipOval(
                child: Image.file(image!,fit: BoxFit.fill,),
              ): const SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar (backgroundColor: Colors.black,),
              ),
              IconButton(onPressed: (){
                openCamera();
              }, icon: Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () {
                    var p = Product.instance(id: _id, name: _name, price: _price, image: image);
                    widget.child.parent!.pmController!.addProduct(p);
                    // print(widget.child.parent!.pmController!.productList);
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TabBars.parent(widget.child.parent!)));
                  },
                  child: Text('Submit')),

            ],
          ),
        ),

      ),
    );

  }
}
