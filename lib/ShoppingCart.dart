import 'package:flutter/foundation.dart';
import 'package:shopper_app/itemList.dart';

class ShoppingCart extends ChangeNotifier {
  late ItemCatalog _catalog;

  final List<int> _itemIds = [];

  ItemCatalog get catalog => _catalog;

  set catalog(ItemCatalog newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
    //Using Notify listeners is mandatory in provider
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}