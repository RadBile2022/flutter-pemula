import 'package:flutterfoundation/models/ProductManager.dart';
import 'package:flutterfoundation/entities/Product.dart';

class PMController {
  late ProductManager _pm;

  PMController(this._pm);

  void addProduct (Product p) {
    _pm.addProduct(p);
  }

  List<Product> get productList => _pm.productList;

}