import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/ProductCreate.dart';

class ProductView extends StatelessWidget{

  final     PMController pmController ;

  const ProductView({Key? key, required this.pmController}):super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Hello World !'),
       actions: <Widget>[
         Padding(padding: EdgeInsets.only(right: 20),
         child: GestureDetector(
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
     body:
         Column(
           children: [
             Text(pmController.productList.toString()),

           ],
         )
   );
  }


}