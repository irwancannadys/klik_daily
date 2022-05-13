import 'package:klik_daily/data/fruit_cart.dart';

class ItemCartModel {
  FruitCart fruitCart;
  int count;

  ItemCartModel({required this.fruitCart, this.count = 1});
}
