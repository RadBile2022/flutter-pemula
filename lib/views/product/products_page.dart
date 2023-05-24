import 'package:flutter/material.dart';
import 'package:fundamental/views/product/product_create.dart';
import 'package:fundamental/views/product/product_edit.dart';

import '../../controllers/Item.dart';
import '../../controllers/OMController.dart';
import '../../controllers/PMController.dart';
import '../order/order_create.dart';
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

  int jumlah = 0;
  double total = 0;

  void _addCart() {
    setState(() {
      jumlah = widget.parent!.order!.getQty();
      total = widget.parent!.order!.getTotal();
    });
  }





  void _showModal(BuildContext context, TextEditingController input, Product p) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mau Beli Berapa ?'),
          content: TextField(
            controller: input,
            decoration: InputDecoration(
              hintText: 'Masukkan qty...',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Lanjut'),
              onPressed: () {
                String inputValue = input.text;
                // Lakukan sesuatu dengan nilai input yang diterima
                print('Input: $inputValue');
                Navigator.of(context).pop();

                Item item = Item();
                item.product = p;
                item.qty = int.parse(inputValue);
                widget.parent!.order!.addItem(item);
                _addCart();
                
              },
            ),
          ],
        );
      },
    );
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
                  return ProductCreatePage(
                    child: widget!,
                  );
                }));
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Product p = widget.parent!.pmController!.productList[index];
          return GestureDetector(
            onTap: () {
              final TextEditingController _inputController = TextEditingController();
              _showModal(context, _inputController, p);
            },
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
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return ProductEditPage(child: widget!, product: p,);

                          }));
                        },
                        child: Icon(Icons.edit),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: widget.parent!.pmController!.productList.length,
      ),
      floatingActionButton: jumlah >= 1 ? _sizedBox() : const Text(''),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  SizedBox _sizedBox() {
    return SizedBox(
      width: double.infinity,
      height: 50, // Sesuaikan tinggi sesuai kebutuhan Anda
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OrderCreatePage(widget.parent!);
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(jumlah.toString()), Text('\$ $total')],
          )),
    );
  }
}
