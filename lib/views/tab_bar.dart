import 'package:flutter/material.dart';
import 'package:fundamental/views/product/products_page.dart';


import '../controllers/CMController.dart';
import '../controllers/OMController.dart';
import '../controllers/PMController.dart';
import '../controllers/Shop.dart';
import 'customer/customer_page.dart';
import 'order/order_page.dart';

class TabBars extends StatefulWidget {
  Shop? shop;
  PMController? pmController;
  OMController? omController;
  CMController? cmController;
  Order? order ;
  Customer? customer    = Customer.instance('0', 'Umum', 'Non Pelanggan');
  int selectedIndex = 0;




  TabBars(Shop shop){
    this.shop = shop;
    pmController = PMController(shop.pm);
    omController = OMController(shop.om);
    cmController = CMController(shop.cm);
    order = Order();
    order!.customer = customer;
  }

  TabBars.parent(TabBars parent){
    pmController = parent.pmController;
    omController = parent.omController;
    cmController = parent.cmController;
    parent.order = Order();
    parent.order!.customer = customer;
    selectedIndex = parent.selectedIndex;
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
        child: OrderListPage(parent!),
      ),
      Container(
        child: CustomerListPage(parent!),
      ),
      Container(
        child: Text('Hallo Dek'),
      ),
    ]);
  }



  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
      return Scaffold(

      body: Container(
        child: _widgetOptions.elementAt(widget.selectedIndex),
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
          ), BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),

        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
