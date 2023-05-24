import 'Item.dart';
import 'CMController.dart';

class OMController {
  late OrderManager _om;

  OMController(this._om);

  void addOrder (Order o) {
    _om.addOrder(o);
  }

  List<Order> get orderList => _om.orderList;

  void removeOrder (Order o) {
    _om.removeOrder(o);
  }

  Order? findOrderById (String id){
    _om.findOrderById(id);
  }

}

class OrderManager {
  List<Order> _orderList = [];

  void addOrder(Order o) {
    _orderList.add(o);
  }

  get orderList => _orderList;

  void removeOrder (Order o){
    _orderList.remove(o);
  }

  Order? findOrderById (String id){
    for (Order o in orderList){
      if(o.id == id){
        return o;
      }
    }
    return null;
  }


}

class Order {
  String? id;
  Customer? customer;
  List<Item> _items = [];

  Order();

  Order.instance(this.id, this.customer, this._items);

  void addItem (Item item){
    _items.add(item);
  }

  List<Item> get items => _items;

  void removeItem (Item item){
    _items.remove(item);
  }

  int getQty(){
    int qty = 0;
    for(Item item in _items){
      qty += item.qty!;
    }
    return qty;
  }

  double getTotal (){
    double total=0;
    for (Item item in _items){
      total += item.subTotal();
    }
    return total;
  }

  @override
  String toString() {
    return 'Order{id: $id, customer: $customer, _items: $_items}';
  }
}