
import 'CMController.dart';
import 'Item.dart';

class OMController {
  late OrderManager _om;

  OMController(this._om);

  void addOrder(Order o) {
    _om.addOrder(o);
  }

  List<Order> get orderList => _om.orderList;

  void removeOrder(Order o) {
    _om.removeOrder(o);
  }

  Order? findOrderById(String id) {
    _om.findOrderById(id);
  }
}

class OrderManager {
  List<Order> _orderList = [];

  OrderManager();

  void addOrder(Order o) {
    _orderList.add(o);
  }

  get orderList => _orderList;

  void removeOrder(Order o) {
    _orderList.remove(o);
  }

  Order? findOrderById(String id) {
    for (Order o in orderList) {
      if (o.id == id) {
        return o;
      }
    }
    return null;
  }

  factory OrderManager.fromJson(Map<String, dynamic> json) {
    final orderListJson = json['orderList'] as List<dynamic>;
    final orderList =
        orderListJson.map((orderJson) => Order.fromJson(orderJson)).toList();
    return OrderManager().._orderList.addAll(orderList);
  }

  Map<String, dynamic> toJson() {
    final orderListJson = _orderList.map((order) => order.toJson()).toList();
    return {
      'orderList': orderListJson,
    };
  }
}

class Order {
  String? id;
  Customer? customer;
  List<Item> _items = [];

  Order();

  Order.instance({this.id, this.customer, List<Item>? items})
      : _items = items ?? [];

  void addItem(Item item) {
    _items.add(item);
  }

  List<Item> get items => _items;

  void removeItem(Item item) {
    _items.remove(item);
  }

  int getQty() {
    int qty = 0;
    for (Item item in _items) {
      qty += item.qty!;
    }
    return qty;
  }

  double getTotal() {
    double total = 0;
    for (Item item in _items) {
      total += item.subTotal();
    }
    return total;
  }

  @override
  String toString() {
    return 'Order{id: $id, customer: $customer, _items: $_items}';
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order.instance(
      id: json['id'],
      customer: Customer.fromJson(json['customer']),
      items: (json['items'] as List<dynamic>)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer?.toJson(),
      'items': _items.map((item) => item.toJson()).toList(),
    };
  }
}
