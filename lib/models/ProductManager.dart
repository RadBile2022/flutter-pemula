import '../entities/Product.dart';

class ProductManager {
  final List<Product> _productList =[];

  void addProduct(Product p){
    _productList.add(p);
  }

  List<Product> get productList => _productList;

  Product? findProductById (String id){
    for (Product p in productList){
      if(p.id == id){
        return p;
      }
    }
    return null;
  }

}