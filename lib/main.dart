import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamental/views/tab_bar.dart';

import 'controllers/CMController.dart';
import 'controllers/PMController.dart';
import 'controllers/Shop.dart';


void main() {
  //
  var product1 = Product.instance(id: '1', name: 'Nasi Pecel', price: 14, image: null);
  var product2 = Product.instance(id: '2', name: 'Soto Ayam', price: 12, image: null);
  var product3 = Product.instance(id: '3', name: 'Rujak Buah', price: 7, image: null);

  var pms = ProductManager();
  var pmController = PMController(pms);
  pmController.addProduct(product1);
  pmController.addProduct(product2);
  pmController.addProduct(product3);
  pmController.addProduct(product1);
  pmController.addProduct(product2);
  pmController.addProduct(product3);
  pmController.addProduct(product1);
  pmController.addProduct(product2);
  pmController.addProduct(product3);
  pmController.addProduct(product1);
  pmController.addProduct(product2);
  pmController.addProduct(product3);
  // print(pmController.productList);

  var customer1 = Customer.instance('1', 'Radar', 'Langsep');
  var customer2 = Customer.instance('2', 'Ahdi', 'Mergan');
  var cms = CustomerManager();
  var cmController = CMController(cms);
  cmController.addCustomer(customer1);
  cmController.addCustomer(customer2);
  // print(cmController.costumerList);
  // print(cmController.findCustomerById('id'));

  var shop = Shop('GFT Store');
  shop.pm = pms;
  shop.cm = cms;
  // pmController: pmController
  runApp(MyApp(shop: shop,));

}



class MyApp extends StatelessWidget {
  final Shop shop;
  // final PMController pmController;
  // , required this.pmController


  const MyApp({super.key , required this.shop});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: TabBars(shop),
    );

    //
    // return CupertinoApp(
    //   title: 'Flutter Demo',
    //   theme: CupertinoThemeData(
    //     primaryColor: CupertinoColors.systemOrange
    //   ),
    //   home: CupertinoApps(pmController: pmController,)
    // );
  }
}

