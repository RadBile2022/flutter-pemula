import 'package:flutter/material.dart';
import 'package:fundamental/views/customer/customer_edit.dart';


import '../../controllers/CMController.dart';
import '../order/order_create.dart';
import '../tab_bar.dart';
import 'customer_create.dart';




class CustomerListPage extends StatefulWidget{
  final TabBars parent;
  // final CMController? cmController ;

  const CustomerListPage(this.parent);

  @override
  State<CustomerListPage> createState() => _CustomerListPage();
}

class _CustomerListPage extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Customer List'),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return CustomerCreatePage(child: widget!,);
                  }));
                },
                child: Icon(Icons.add),
              ),),
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(itemBuilder: (context,index){
          final Customer c = widget.parent.cmController!.costumerList[index];
          return GestureDetector(
            onTap: (){
              widget.parent.order!.customer = c;
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return OrderCreatePage(widget.parent!);
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
                        Text(c.name.toString(), style: const TextStyle(fontSize: 25),),
                        const SizedBox(height: 10,),
                        Text(c.address.toString())
                      ],
                    ),
                  ), ),  Expanded(flex:1, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Icon(Icons.edit),
                      onPressed: ()
                      {

                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return CustomerEditPage(child: widget!, customer: c,);

                        }));
                      },
                    )
                  ), ),

                ],
              ),
            ),
          );
        },
          itemCount: widget.parent.cmController!.costumerList.length,

        )
    );
  }
}