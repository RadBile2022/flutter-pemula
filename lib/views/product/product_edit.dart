import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/views/product/products_page.dart';

import '../../controllers/PMController.dart';
import '../../tab_bar.dart';


class ProductEditPage extends StatefulWidget {
  // final PMController pmController;
  final ProductListPage child;
  final Product product;

  const ProductEditPage({Key? key, required this.child, required this.product}) : super(key: key);


  @override
  _ProductEditPage createState() => _ProductEditPage();
}

class _ProductEditPage extends State<ProductEditPage> {
  late String _id , _name;
  late double _price;
  File? image;



  late TextEditingController _idController,_nameController,_priceController,_imageController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.product.id);
    _nameController = TextEditingController(text: widget.product.name);
    _priceController = TextEditingController(text: widget.product.price.toString());
  }

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
                controller: _idController,
                decoration: InputDecoration(hintText: 'What id', labelText: 'Id'),
                onChanged: (String value) {
                  setState(() {
                    _id = value;
                  });
                },
              ),
              TextField(
                controller: _nameController,
                decoration:
                InputDecoration(hintText: 'What Title', labelText: 'Title'),
                onChanged: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              TextField(
                controller: _priceController,
                decoration:
                InputDecoration(hintText: 'What Price', labelText: 'Price'),
                onChanged: (String value) {
                  setState(() {
                    _price = double.parse(value);
                  });
                },
              ),
              widget.product.image != null ? ClipOval(
                child: Image.file(widget.product.image!,fit: BoxFit.fill,height: 50, width: 50,),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(right: 12.0),child:
                  ElevatedButton(
                    onPressed: () {
                      widget.child.parent!.pmController!.removeProduct(widget.product);
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        widget.child!.parent!.selectedIndex =0;
                        return TabBars.parent(widget.child.parent!);
                      }));
                    },
                    child: Text('Delete'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red[300]!),
                    ), ),

                      ),
                  Padding(padding: EdgeInsets.only(right: 12.0),
                  child:                   ElevatedButton(
                      onPressed: () {
                        widget.product.id = _idController.text;
                        widget.product.name = _nameController.text;
                        widget.product.price = double.parse(_priceController.text);
                        widget.product.image = image;
                        // print(widget.product);
                        // var p = Product.instance(id: _id, name: _name, price: _price, image: image);
                        // widget.child.parent!.pmController!.addProduct(p);
                        //
                        // // print(widget.child.parent!.pmController!.productList);
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          widget.child!.parent!.selectedIndex =0;
                          return TabBars.parent(widget.child.parent!);
                        }));
                      },
                      child: Text('Update')),
                      )
                ],
              )



            ],
          ),
        ),

      ),
    );

  }
}
