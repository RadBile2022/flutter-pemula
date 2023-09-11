import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/CMController.dart';
import '../../controllers/Item.dart';
import '../customer/customer_page.dart';
import '../../tab_bar.dart';

class OrderCreatePage extends StatefulWidget {
  final TabBars? parent;

  const OrderCreatePage(this.parent);

  @override
  _OrderCreatePage createState() => _OrderCreatePage();
}

class _OrderCreatePage extends State<OrderCreatePage> {
  // TextEditingController textFieldController = TextEditingController();
  //
  // void validateData() {
  //   String userInput = textFieldController.text;
  //   // Lakukan validasi sesuai kebutuhan
  //   // Contoh validasi sederhana: pastikan teks yang dimasukkan tidak kosong
  //   if (userInput.isNotEmpty) {
  //     setState(() {
  //       String id = userInput;
  //       Customer a = Customer.instance('id', 'nama', 'alamat');
  //       widget.parent!.cmController!.addCustomer(a);
  //
  //       customer = widget.parent!.cmController!.findCustomerById(id)!;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Order'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.lime,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomerListPage(widget.parent!);
                    }));
                  },
                  child: Text('Customer'),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(
                    style: TextStyle(fontSize: 25),
                    widget.parent!.order!.customer!.name!)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Item item = widget.parent!.order!.items[index];
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.product!.name.toString(),
                                  style: const TextStyle(fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: Text(item.subTotal().toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child:
                                          Text('${item.qty.toString()} pcs  '),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.parent!.order!.removeItem(item);
                                });
                                // Navigator.push(context,MaterialPageRoute(builder: (context){
                                //   return ProductEditPage(child: widget!, product: p,);
                                //
                                // }));
                              },
                              child: Icon(Icons.delete),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red[300]!),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: widget.parent!.order!.items.length,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 45,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total \$ ${widget.parent!.order!.getTotal()}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(' Check Out Order '),
                  Icon(Icons.arrow_right_sharp)
                ],
              )
            ],
          ),
          onPressed: () {
            widget.parent!.omController!.addOrder(widget.parent!.order!);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              widget.parent!.selectedIndex = 1;
              return TabBars.parent(widget.parent!);
            }));

            // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TabBars.parent(widget.parent!)));
          },
        ),
      ),
    );
  }
}
