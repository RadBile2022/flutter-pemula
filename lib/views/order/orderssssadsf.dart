import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/OMController.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/tab_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/CMController.dart';
import '../../controllers/Item.dart';


class OrderCreatePage extends StatefulWidget {
  final TabBars? parent;

  // final OMController omController;
  // final CMController cmController;
  // final PMController pmController;
  const OrderCreatePage({Key? key, required this.parent}) : super(key: key);

  @override
  _OrderCreatePage createState() => _OrderCreatePage();
}

class _OrderCreatePage extends State<OrderCreatePage> {
  Customer customer = Customer.instance('idj', 'afdsaf', 'alamat');
  TextEditingController textFieldController = TextEditingController();

  void validateData() {
    String userInput = textFieldController.text;
    // Lakukan validasi sesuai kebutuhan
    // Contoh validasi sederhana: pastikan teks yang dimasukkan tidak kosong
    if (userInput.isNotEmpty) {
      setState(() {
        String id = userInput;
        Customer a = Customer.instance('id', 'nama', 'alamat');
        widget.parent!.cmController!.addCustomer(a);


        customer = widget.parent!.cmController!.findCustomerById(id)!;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                labelText: 'Masukkan teks',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: validateData,
              child: Text('Customer'),
            ),
            SizedBox(height: 16.0),
            Text(customer.nama!, style: TextStyle(
                fontSize:  59
            ),),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _showDialog,
              child: Text('Add Item'),
            ),
            SizedBox(height: 16.0),

          ],
        ),
      ),
    );
  }

  String enteredText = '';
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Input Text'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                enteredText = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Lakukan sesuatu dengan enteredText
                // Misalnya, tampilkan di console
                setState(() {
                  String id = enteredText;
                });
                print('Entered text: $enteredText');
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
//
//
//
//   TextEditingController _idCustomer = TextEditingController();
//   late Customer customer ;
//
//
// @override
// void dispose() {
//   _idCustomer.dispose();
//   super.dispose();
// }
//
//   void _datas(){
//     customer!.nama='raden';
//     build(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   customer  = Customer();
//   customer!.nama = 'ra';
//     return Scaffold(
//       body: SafeArea(
//         child:  Padding(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(hintText: 'What id', labelText: 'Id'),
//                 onChanged: (String value) {
//                   setState(() {
//                   });
//                 },
//               ),
//               TextField(
//                 controller: _idCustomer,
//                 decoration:
//                 InputDecoration(hintText: 'What Title', labelText: 'Customer'),
//               ),
//               ElevatedButton(onPressed: (){
//                 _datas();
//                 // var inputText = _idCustomer.text;
//                 // Customer a = Customer.add('id', 'nama', 'alamat');
//                 // widget.cmController.addCustomer(a);
//                 // // customer = Customer();
//                 // // customer = widget.cmController.findCustomerById(inputText)!;
//                 // customer.nama='radar';
//                 // // var findCustomer = widget.cmController.findCustomerById(_ids!);
//                 // // print(findCustomer);
//               }, child: Text('Cari Customer')),
//               Text(customer.nama!)
//               // TextField(
//               //   decoration:
//               //   InputDecoration(hintText: 'Where Addres', labelText: 'Address'),
//               //   onChanged: (String value) {
//               //     setState(() {
//               //       _alamat = value;
//               //     });
//               //   },
//               // ),
//               //
//               //
//               // ElevatedButton(
//               //     onPressed: () {
//               //       var o = Order.add(_id, customer, _items)
//               //       var c = Customer.add(_id, _nama, _alamat);
//               //       cmController.addCustomer(c);
//               //       print(cmController.costumerList);
//               //       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TabBars.cmC(cmController)));
//               //     },
//               //     child: Text('Submit')),
//
//             ],
//           ),
//         ),
//
//       ),
//     );
//
//   }


}
