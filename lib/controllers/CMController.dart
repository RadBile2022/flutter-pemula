

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
}