import 'dart:io';


class PMController {
  late ProductManager _pm;

  PMController(this._pm);

  void addProduct(Product p) {
    _pm.addProduct(p);
  }

  List<Product> get productList => _pm.productList;

  void removeProduct(Product p) {
    _pm.removeProduct(p);
  }

  Product? findProductById(String id) => _pm.findProductById(id);

}


class ProductManager {
  final List<Product> _productList = [];

  void addProduct(Product p) {
    _productList.add(p);
  }

  List<Product> get productList => _productList;

  void removeProduct(Product p) {
    _productList.remove(p);
  }


  Product? findProductById(String id) {
    for (Product p in productList) {
      if (p.id == id) {
        return p;
      }
    }
    return null;
  }
}


class Product {
  String? id, name;
  double? price;
  File? image;


  Product.instance({ required this.id,
    required this.name,
    required this.price,
    required this.image});

  Product();

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, image: $image}';
  }
}