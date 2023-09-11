

import 'PMController.dart';

class Item {
  int? id;
  Product? product;
  int? qty;

  Item();

  double subTotal () {
    double sub = product!.price!*qty!;
    return sub;
  }

  Item.instance(this.product, this.qty);

  @override
  String toString() {
    return 'Item{id: $id, product: $product, qty: $qty}';
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item.instance(
       Product.fromJson(json['product']),
       json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product?.toJson(),
      'qty': qty,
    };
  }
}