import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fundamental/views/product/products_page.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/PMController.dart';
import '../tab_bar.dart';


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
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  Future openGallery() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
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
                child: Image.file(image!,fit: BoxFit.fill,height: 50, width: 50,),
              ): const SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar (backgroundColor: Colors.black,),
              ),
              IconButton(onPressed: (){
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('Camera'),
                            onTap: () {
                              openCamera();
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text('Galery'),
                            onTap: () {
                              openGallery();
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text('Close'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );


              }, icon: Icon(Icons.photo)),
              ElevatedButton(
                  onPressed: () {
                    var p = Product.instance(id: _id, name: _name, price: _price, image: image);
                    widget.child.parent!.pmController!.addProduct(p);

                    // print(widget.child.parent!.pmController!.productList);
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                      widget.child!.parent!.selectedIndex =0;

                      return TabBars.parent(widget.child.parent!);

                    }));
                  },
                  child: Text('Submit')),



            ],
          ),
        ),

      ),
    );

  }
}
