
import 'package:flutter/material.dart';
import 'package:untitled2/tab_bar.dart';


import 'controllers/CMController.dart';
import 'controllers/PMController.dart';
import 'controllers/Shop.dart';


Future<void> main() async {
  //
  String pecel ='https://asset.kompas.com/crops/etxkCgz_0N5ZbdP6YGJScpobPVk=/60x23:959x622/750x500/data/photo/2020/11/05/5fa3f16d9c1cf.jpg';
  String soto = 'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2023/01/16/2155155208.jpg';
  String rujak ='https://rinaresep.com/wp-content/uploads/2021/12/rujak-buah.jpg';
  var product1 = Product.instance(id: '1', name: 'Nasi Pecel', price: 22, image: null);
  var product2 = Product.instance(id: '2', name: 'Soto Ayam', price: 11.5, image: null);
  var product3 = Product.instance(id: '3', name: 'Rujak Buah', price: 5.7, image: null);

  var pms = ProductManager();
  var pmController = PMController(pms);
  pmController.addProduct(product1);
  pmController.addProduct(product2);
  pmController.addProduct(product3);
  // pmController.addProduct(product1);
  // pmController.addProduct(product2);
  // pmController.addProduct(product3);
  // pmController.addProduct(product1);
  // pmController.addProduct(product2);
  // pmController.addProduct(product3);
  // pmController.addProduct(product1);
  // pmController.addProduct(product2);
  // pmController.addProduct(product3);
  // print(pmController.productList);

  var customer1 = Customer.instance('1', 'Radar', 'Langsep');
  var customer2 = Customer.instance('2', 'Ahdi', 'Mergan');
  var cms = CustomerManager();
  var cmController = CMController(cms);
  cmController.addCustomer(customer1);
  cmController.addCustomer(customer2);
  // print(cmController.costumerList);
  // print(cmController.findCustomerById('id'));

  // widget.storage.readCounter().then((value) {
  //   setState(() {
  //     _counter = value;
  //   });
  // });

  // FileServices f = FileServices();
  // Shop? shop = await f.readFile() as Shop?;
  // print(shop);
  // if (shop == null) {
 var   shop = Shop("GFT Store",);
    // Inisialisasi properti lain jika diperlukan
    shop.pm = pms;
    shop.cm = cms;

  // Shop? shop =   FileServices.readFile() as Shop?;
  //
  // if (shop == null) {
  //   shop = Shop("GFT Store");
  //   shop.pm = pms;
  //   shop.cm = cms;
  // }

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

