import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/CMController.dart';
import '../tab_bar.dart';
import 'customer_page.dart';

class CustomerEditPage extends StatefulWidget {
  // final CMController cmController;
  final CustomerListPage child;
  final Customer customer;

  const CustomerEditPage({Key? key, required this.child, required this.customer}) : super(key: key);

  @override
  _CustomerEditPage createState() => _CustomerEditPage();
}

class _CustomerEditPage extends State<CustomerEditPage> {
  late String _id, _nama, _alamat;



  late TextEditingController _idController,_nameController,_addressController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.customer.id);
    _nameController = TextEditingController(text: widget.customer.name);
    _addressController = TextEditingController(text: widget.customer.address);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: _idController,
                decoration:
                InputDecoration(hintText: 'What id', labelText: 'Id'),
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
                    _nama = value;
                  });
                },
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                    hintText: 'Where Addres', labelText: 'Address'),
                onChanged: (String value) {
                  setState(() {
                    _alamat = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: const EdgeInsets.only(right: 12),
                    child:               ElevatedButton(
                        onPressed: () {
                          widget.child.parent!.cmController!.removeCustomer(widget.customer);

                          // print(widget.product);
                          // var c = Customer.instance(_id, _nama, _alamat);
                          // widget.child.parent!.cmController!.addCustomer(c);
                          // print(widget.child.parent!.cmController!.costumerList);
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            widget.child!.parent!.selectedIndex =2;
                            return TabBars.parent(widget.child.parent!);
                          }));
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          //   widget.child.parent.selectedIndex = 2;
                          //   return TabBars.parent(widget.child.parent);
                          // }));
                        },
                        child: Text('Delete'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red[300]!),
                    ),),
                  ),
                  Padding(padding: const EdgeInsets.only(right: 12),
                    child:
                    ElevatedButton(
                        onPressed: () {
                          widget.customer.id = _idController.text;
                          widget.customer.name = _nameController.text;
                          widget.customer.address = _addressController.text;
                          // print(widget.product);
                          // var c = Customer.instance(_id, _nama, _alamat);
                          // widget.child.parent!.cmController!.addCustomer(c);
                          // print(widget.child.parent!.cmController!.costumerList);
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            widget.child!.parent!.selectedIndex =2;
                            return TabBars.parent(widget.child.parent!);
                          }));
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          //   widget.child.parent.selectedIndex = 2;
                          //   return TabBars.parent(widget.child.parent);
                          // }));
                        },
                        child: Text('Update')),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
