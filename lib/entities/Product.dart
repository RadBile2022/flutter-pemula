import 'dart:io';

class Product{
  String? id, name;
  double? price;
  File? image;



  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image
  });

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, image: $image}';
  }
}