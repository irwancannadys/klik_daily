import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/data/item_cart_model.dart';
import 'package:klik_daily/feature/cart/cart_view_model.dart';
import 'package:klik_daily/utils/price_format.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatelessWidget {
  final ItemCartModel itemCartModel;

  const ItemCart({required this.itemCartModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fruitCartId = itemCartModel.fruitCart.id ?? 0;
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0, left: 30, right: 30),
      padding: const EdgeInsets.only(top: 5.0, left: 10, bottom: 15, right: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: klikGrey),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemCartModel.fruitCart.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<CartViewModel>().removeItem(fruitCartId);
                    context.read<CartViewModel>().getListFruit();
                  },
                  child: Image.asset("assets/remove.png"),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: klikGrey,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        itemCartModel.fruitCart.image,
                        height: 64.0,
                        width: 55.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 7.0),
                          child: Text(
                            itemCartModel.fruitCart.name,
                            style: const TextStyle(
                              color: klikBlack,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 9.0),
                          child: Text(
                            CurrencyFormat.convertToIdr(itemCartModel.fruitCart.price) + '/kg',
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: klikBlack,
                            ),
                          ),
                        ),
                        RatingBar.builder(
                          itemSize: 14.0,
                          initialRating: itemCartModel.fruitCart.ratting.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(right: 3.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartViewModel>()
                              .decrementQuantity(fruitCartId);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12.0),
                          width: 30,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: klikGreen),
                          ),
                          child: const Center(child: Text("-")),
                        ),
                      ),
                      Text(itemCartModel.count.toString()),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartViewModel>()
                              .incrementQuantity(fruitCartId);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12.0),
                          width: 30,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: klikGreen),
                          ),
                          child: const Center(child: Text("+")),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
