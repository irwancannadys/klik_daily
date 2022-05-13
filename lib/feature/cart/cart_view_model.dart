import 'package:flutter/foundation.dart';
import 'package:klik_daily/data/item_cart_model.dart';
import 'package:klik_daily/database/klik_daily_database.dart';

class CartViewModel extends ChangeNotifier {
  final dbHelper = CartDataBase.instance;
  var _itemCartModel = <ItemCartModel>[];

  List<ItemCartModel> get itemCartModel => _itemCartModel;

  String get totalPrice {
    var result = 0;
    for (var itemCart in _itemCartModel) {
      result += itemCart.count * itemCart.fruitCart.price;
    }
    return result.toString();
  }

  String get totalItem {
    var result = 0;
    for (var itemCart in _itemCartModel) {
      result += itemCart.count;
    }
    return result.toString();
  }

  void getListFruit() async {
    _itemCartModel = [];
    var fruitCartList = await dbHelper.readAllFruits();
    for (var fruitCart in fruitCartList) {
      _itemCartModel.add(ItemCartModel(fruitCart: fruitCart));
    }
    notifyListeners();
  }

  void removeItem(int id) async {
    await dbHelper.delete(id);
    notifyListeners();
  }

  void incrementQuantity(int cartId) {
    var cart =
        _itemCartModel.firstWhere((element) => element.fruitCart.id == cartId);
    cart.count++;
    notifyListeners();
  }

  void decrementQuantity(int cartId) {
    var cart =
        _itemCartModel.firstWhere((element) => element.fruitCart.id == cartId);
    if (cart.count == 1) return;
    cart.count--;
    notifyListeners();
  }
}
