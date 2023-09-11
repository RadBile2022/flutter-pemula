

class CMController {
  late CustomerManager _cm;

  CMController(this._cm);

  void addCustomer (Customer c) {
    _cm.addCustomer(c);
  }

  List<Customer> get costumerList => _cm.customerList;

  void removeCustomer (Customer c) {
    _cm.removeCustomer(c);
  }

  Customer? findCustomerById (String id){
    return _cm.findCustomerById(id);
  }
}


class CustomerManager {
  List<Customer> _costumerList = [];

  CustomerManager();

  void addCustomer(Customer c) {
    _costumerList.add(c);
  }

  get customerList => _costumerList;

  void removeCustomer (Customer c){
    _costumerList.remove(c);
  }

  Customer? findCustomerById (String id){
    for (Customer c in customerList) {
      if (c.id == id) {
        return c;
      }
    }
    return null;
  }

  factory CustomerManager.fromJson(Map<String, dynamic> json) {
    final customerListJson = json['customerList'] as List<dynamic>;
    final customerList = customerListJson.map((customerJson) => Customer.fromJson(customerJson)).toList();
    return CustomerManager()..customerList.addAll(customerList);
  }

  Map<String, dynamic> toJson() {
    final customerListJson = customerList.map((customer) => customer.toJson()).toList();
    return {
      'customerList': customerListJson,
    };
  }
}


class Customer {
  String? id;
  String? name;
  String? address;

  Customer();

  Customer.instance(this.id,this.name,this.address);

  @override
  String toString() {
    return 'Customer{id: $id, nama: $name, alamat: $address}';
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer.instance(
       json['id'],
       json['name'],
       json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }
}