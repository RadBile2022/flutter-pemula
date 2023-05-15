import 'package:flutterfoundation/controllers/CMController.dart';
import 'package:flutterfoundation/controllers/OMController.dart';
import 'package:flutterfoundation/controllers/PMController.dart';


class Shop {
  String? name;

  Shop(this.name);

  ProductManager _pm = ProductManager();
  OrderManager _om = OrderManager();
  CustomerManager _cm = CustomerManager();

  ProductManager get pm => _pm;

  set pm(ProductManager value) {
    _pm = value;
  }

  OrderManager get om => _om;

  set om(OrderManager value) {
    _om = value;
  }

  CustomerManager get cm => _cm;

  set cm(CustomerManager value) {
    _cm = value;
  }
}