import 'package:flutter/material.dart';
import 'package:flutterfoundation/controllers/Item.dart';
import 'package:flutterfoundation/controllers/PMController.dart';
import 'package:flutterfoundation/views/product/product_create.dart';

import '../../controllers/OMController.dart';
import '../tab_bar.dart';

class ProductListPage extends StatefulWidget {
  // final PMController? pmController ;
  final TabBars? parent;

  // const ProductView({Key? key, required this.pmController}):super(key: key);

  const ProductListPage(this.parent);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Product p;
  int jumlah =0;
  double total  = 0;
  Order o = Order();


  void _addCart(){
    setState(() {
      jumlah = o.getQty();
      total = o.getTotal();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductCreatePage(child: widget!,);
                }));
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body:
      ListView.builder(
        itemBuilder: (context, index) {
          Product p = widget.parent!.pmController!.productList[index];
          return GestureDetector(
            onTap: () {},
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: p.image != null
                        ? Image.file(
                      p.image!,
                      width: 100,
                      height: 50,
                    )
                        : Text('data'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            p.name.toString(),
                            style: const TextStyle(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(p.price.toString())
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          int qty = 0;
                          setState(() {
                            qty++;
                          });
                          Item item = Item();
                          item.product = p;
                          item.qty = qty;
                          o.addItem(item);
                          print(o.items);
                          print(o.getQty());
                          _addCart();
                        },
                        child: Text('+'),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: widget.parent!.pmController!.productList.length,
      ),

      floatingActionButton: jumlah >= 1 ? _sizedBox():Text('d'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  SizedBox _sizedBox() {
    return SizedBox(
      width: double.infinity,
      height: 50, // Sesuaikan tinggi sesuai kebutuhan Anda
      child: ElevatedButton(
        onPressed: () {
          // Aksi yang ingin dilakukan saat tombol ditekan
        },
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(jumlah.toString()),
            Text('\$ $total')
          ],
        )
      ),
    );
  }



}
