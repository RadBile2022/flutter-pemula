import 'package:flutter/material.dart';

import '../../controllers/OMController.dart';
import '../product/products_page.dart';
import '../../tab_bar.dart';
import 'order_edit.dart';




class OrderListPage extends StatefulWidget{
  final TabBars parent;
  // final CMController? cmController ;

  const OrderListPage(this.parent);

  @override
  State<OrderListPage> createState() => _OrderListPage();
}

class _OrderListPage extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order List'),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return ProductListPage(widget.parent!);
                  }));
                },
                child: Icon(Icons.add),
              ),),
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(itemBuilder: (context,index){
          final Order o = widget.parent.omController!.orderList[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return OrderEditPage(widget.parent!,o);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Expanded( flex: 1,
                  //     child: Image.file(p.image!, width: 100,height: 50,),
                  // ),
                  Expanded(flex:2, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(o.customer!.name.toString(), style: const TextStyle(fontSize: 25),),
                        const SizedBox(height: 10,),
                        Text(o.getTotal().toString())
                      ],
                    ),
                  ), )
                ],
              ),
            ),
          );
        },
          itemCount: widget.parent.omController!.orderList.length,

        )
    );
  }
}




































// import 'package:flutter/material.dart';
// import 'package:flutterfoundation/controllers/CMController.dart';
// import 'package:flutterfoundation/controllers/OMController.dart';
// import 'package:flutterfoundation/controllers/PMController.dart';
// import 'package:flutterfoundation/views/customer/customer_create.dart';
// import 'package:flutterfoundation/views/order/order_create.dart';
// import 'package:flutterfoundation/views/product/product_create.dart';
//
//
// import '../tab_bar.dart';
//
//
// class OrderListPage extends StatefulWidget{
//   final TabBars? parent;
//
// // final  OMController? omController;
// // final CMController? cmController;
// // final PMController? pmController;
//   const OrderListPage(  this.parent );
//
//   @override
//   State<OrderListPage> createState() => _OrderListPage();
// }
//
// class _OrderListPage extends State<OrderListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Order List'),
//           actions: <Widget>[
//             Padding(padding: EdgeInsets.only(right: 20),
//               child: InkWell(
//                 onTap: (){
//                   Navigator.push(context,MaterialPageRoute(builder: (context){
//                     return OrderCreatePage(parent: widget.parent,);
//                   }));
//                 },
//                 child: Icon(Icons.add),
//               ),),
//           ],
//           automaticallyImplyLeading: false,
//         ),
//         body: ListView.builder(itemBuilder: (context,index){
//           final Order o = widget.parent!.omController!.orderList[index];
//           return GestureDetector(
//             onTap: (){
//             },
//             child: Card(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   // Expanded( flex: 1,
//                   //     child: Image.file(p.image!, width: 100,height: 50,),
//                   // ),
//                   Expanded(flex:2, child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(o.id.toString(), style: const TextStyle(fontSize: 25),),
//                         const SizedBox(height: 10,),
//                         Text('13 Mei 2022')
//                       ],
//                     ),
//                   ), )
//                 ],
//               ),
//             ),
//           );
//         },
//           itemCount: widget.parent!.omController!.orderList.length,
//
//         )
//     );
//   }
// }