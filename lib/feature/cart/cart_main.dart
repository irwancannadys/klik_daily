import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/feature/cart/cart_view_model.dart';
import 'package:klik_daily/feature/cart/item_cart.dart';
import 'package:klik_daily/utils/price_format.dart';
import 'package:provider/provider.dart';
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
        },
        builder: (ctx, viewModel, child) {
          var list = viewModel.itemCartModel;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: klikGreen,
              title: const Text("Cart Product"),
            ),
            body: Visibility(
              replacement: emptyView(),
              visible: list.isEmpty ? false : true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20.0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemCart(itemCartModel: list[index]);
                      },
                      itemCount: list.length,
                    ),
                  ),
                  Builder(builder: (context) {
                    var totalPrice =
                        context.select((CartViewModel vm) => vm.totalPrice);
                    var totalItem =
                        context.select((CartViewModel vm) => vm.totalItem);
                    return Container(
                      padding: EdgeInsets.only(
                          top: 11.0, left: 15.0, right: 15.0, bottom: 11.0),
                      margin: EdgeInsets.only(
                          left: 33.0, right: 33.0, top: 8.0, bottom: 10.0),
                      decoration: const BoxDecoration(
                          color: klikGreen,
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total item : ' + totalItem,
                                  style: TextStyle(color: klikWhite),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 4.0, bottom: 4.0),
                                  height: 1.0,
                                  width: 70.0,
                                  color: klikWhite,
                                ),
                                Text(
                                  CurrencyFormat.convertToIdr(
                                      int.parse(totalPrice)),
                                  style: TextStyle(
                                      color: klikWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Checkout",
                            style: TextStyle(
                              color: klikWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        });
  }

  Widget emptyView() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/cartempty.png",
            width: 125.0,
            height: 125.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            child: Text(
              "Your cart is empty, lets go to \nshoping in our store!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}
