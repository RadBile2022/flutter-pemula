


import 'CMController.dart';
import 'OMController.dart';
import 'PMController.dart';

class Shop {
  String? name;

  Shop(this.name);
  Shop.instance(this.name, this._pm, this._om,this._cm);

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

  // factory Shop.fromJson(Map<String, dynamic> json) {
  //   return Shop.instance(
  //     json['name'],
  //     ProductManager.fromJson(json['pm']),
  //     OrderManager.fromJson(json['om']),
  //     CustomerManager.fromJson(json['cm']),
  //     // Inisialisasi properti lain dari json
  //   );
  // }
  //
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'pm': _pm.toJson(),
  //     'om': _om.toJson(),
  //     'cm': _cm.toJson(),
  //     // Properti lain yang perlu di-serialize ke JSON
  //   };
  // }
}
