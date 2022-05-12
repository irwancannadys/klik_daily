import 'package:flutter/material.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/data/fruit_cart.dart';
import 'package:klik_daily/database/klik_daily_database.dart';
import 'package:klik_daily/feature/cart/cart_view_model.dart';
import 'package:klik_daily/feature/cart/item_cart.dart';
import 'package:stacked/stacked.dart';

class CartMain extends StatefulWidget {
  const CartMain({Key? key}) : super(key: key);

  @override
  _CartMainState createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(),
        onModelReady: (CartViewModel viewModel) async {
          viewModel.getListFruit();
          // viewModel.addValueList();
        },
        builder: (ctx, viewModel, child) {
          var list = viewModel.fruitCart;
          // var list = viewModel.listFruit;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: klikGreen,
              title: Text("Cart Product"),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemCart(
                    cartDataModel: list[index],
                    removeItemCart: (cartDataModel) {
                      viewModel.removeItem(cartDataModel.id ?? 0);
                      viewModel.getListFruit();
                    },
                  );
                },
                itemCount: list.length,
              ),
            ),
          );
        });
  }
}
