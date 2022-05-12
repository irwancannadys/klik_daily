
import 'package:flutter/foundation.dart';
import 'package:klik_daily/data/cart_data.dart';
import 'package:klik_daily/data/fruit_cart.dart';
import 'package:klik_daily/database/klik_daily_database.dart';

class CartViewModel extends ChangeNotifier {

  List<CartDataModel> listFruit = [];
  List<FruitCart> fruitCart = [];

  int deleteIdCart = 0;

  final dbHelper = CartDataBase.instance;

  List<CartDataModel> addValueList() {
    listFruit.add(CartDataModel("Sweet Apple Indonesia", "assets/apple.png", 20000, 3));
    listFruit.add(CartDataModel("Sweet Apple Belanda", "assets/apple.png", 50000, 5));
    listFruit.add(CartDataModel("Sweet Apple Canada", "assets/apple.png", 23000, 2));
    listFruit.add(CartDataModel("Sweet Orange Belanda", "assets/oranges.png", 25000, 3));
    listFruit.add(CartDataModel("Sweet Orange Germany", "assets/oranges.png", 50000, 3));
    listFruit.add(CartDataModel("Sweet Banana USA", "assets/bananas.png", 70000, 3));
    listFruit.add(CartDataModel("Sweet Banana London", "assets/bananas.png", 55000, 3));
    listFruit.add(CartDataModel("Sweet Banana Swizz", "assets/bananas.png", 100000, 3));
    return listFruit;
  }

  void removeItemCart(int position) {
    listFruit.removeAt(position);
    notifyListeners();
  }

  void getListFruit() async {
    fruitCart = await dbHelper.readAllFruits();
    notifyListeners();
  }

  void removeItem(int id) async {
    await dbHelper.delete(id);
    notifyListeners();
  }
}