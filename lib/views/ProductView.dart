import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/ProductCreate.dart';

import '../entities/Product.dart';

class ProductView extends StatelessWidget{

  final PMController pmController ;

  const ProductView({Key? key, required this.pmController}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Hello World !'),
       actions: <Widget>[
         Padding(padding: EdgeInsets.only(right: 20),
         child: InkWell(
           onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context){
               return ProductCreate(pmController: pmController);
             }));
           },
           child: Icon(Icons.add),
         ),),
       ],
       automaticallyImplyLeading: false,
     ),
     body: ListView.builder(itemBuilder: (context,index){
       final Product p = pmController.productList[index];
       return GestureDetector(
         onTap: (){
         },
         child: Card(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Expanded( flex: 1,
                   child: Image.file(p.image!, width: 100,height: 50,),
               ),
               Expanded(flex:2, child: Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(p.name.toString(), style: const TextStyle(fontSize: 25),),
                     const SizedBox(height: 10,),
                     Text(p.price.toString())
                   ],
                 ),
               ), )
             ],
           ),
         ),
       );
     },
       itemCount: pmController.productList.length,

     )
   );
  }


}