import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/CMController.dart';
import '../tab_bar.dart';
import 'customer_page.dart';

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
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                decoration:
                    InputDecoration(hintText: 'What id', labelText: 'Id'),
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
                decoration: InputDecoration(
                    hintText: 'Where Addres', labelText: 'Address'),
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      widget.child.parent.selectedIndex = 2;
                      return TabBars.parent(widget.child.parent);
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
