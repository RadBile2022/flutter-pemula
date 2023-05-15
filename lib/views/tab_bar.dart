import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/CMController.dart';
import 'package:flutterfoundation/controllers/OMController.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/customer/customer_page.dart';
import 'package:flutterfoundation/views/order/order_page.dart';
import 'package:flutterfoundation/views/product/products_page.dart';

import '../controllers/Shop.dart';

class TabBars extends StatefulWidget {
  Shop? shop;
  PMController? pmController;
  OMController? omController;
  CMController? cmController;

  TabBars(Shop shop){
    this.shop = shop;
    pmController = PMController(shop.pm);
    omController = OMController(shop.om);
    cmController = CMController(shop.cm);
  }

  TabBars.parent(TabBars parent){
    pmController = parent.pmController;
    omController = parent.omController;
    cmController = parent.cmController;
    }

   @override
  State<TabBars> createState() => _TabBars(parent:this);
}

class _TabBars extends State<TabBars> {
  TabBars? parent;
  static final List<Widget> _widgetOptions = [];
  // ProductView( widget)
  // OrderListPage(widget)
  // CustomerListPage(widget.cmController)
  _TabBars({required this.parent}) {
    _widgetOptions.addAll([
      Container(
        child: ProductListPage(parent!),
      ),
      Container(
        child: Text('asfd'),
      ),
      Container(
        child: CustomerListPage(parent!),
      ),
    ]);
  }

  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_sharp),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_sharp),
            label: 'Customer',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}
