import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/customer/customer_page.dart';
import 'package:flutterfoundation/views/tab_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/CMController.dart';


class CustomerCreatePage extends StatefulWidget {
  // final CMController cmController;
  final CustomerListPage child;

  const CustomerCreatePage({Key? key, required this.child}) : super(key: key);

  @override
  _CustomerCreatePage createState() => _CustomerCreatePage();
}

class _CustomerCreatePage extends State<CustomerCreatePage> {

  late String _id, _nama, _alamat;

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
                    _nama = value;
                  });
                },
              ),
              TextField(
                decoration:
                InputDecoration(hintText: 'Where Addres', labelText: 'Address'),
                onChanged: (String value) {
                  setState(() {
                    _alamat = value;
                  });
                },
              ),


              ElevatedButton(
                  onPressed: () {
                    var c = Customer.instance(_id, _nama, _alamat);
                    widget.child.parent!.cmController!.addCustomer(c);
                    // print(widget.child.parent!.cmController!.costumerList);
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TabBars.parent(widget.child.parent)));
                  },
                  child: Text('Submit')),

            ],
          ),
        ),

      ),
    );

  }
}
