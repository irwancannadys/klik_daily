import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/data/cart_data.dart';

import '../../data/fruit_cart.dart';

class ItemCart extends StatefulWidget {
  // Function onMinusCallback;
  // Function onPlusCallback;
  //
  //
  // ItemCart({required this.onMinusCallback, required this.onPlusCallback});

  final FruitCart cartDataModel;
  final Function(FruitCart) removeItemCart;

  ItemCart({required this.cartDataModel, required this.removeItemCart});

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  int valueCount = 0;

  _incrementValuePrice() {
    setState(() {
      valueCount++;
    });
  }

  _decrementValuePrice() {
    setState(() {
      if (valueCount <= 0) {
        valueCount = 0;
      } else {
        valueCount--;
      }
    });
  }

  String calculateValue() {
    int result = widget.cartDataModel.price * valueCount;
    print(result);
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    calculateValue();
    return Container(
      margin: EdgeInsets.only(bottom: 8.0, left: 30, right: 30),
      padding: EdgeInsets.only(top: 5.0, left: 10, bottom: 15, right: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: klikGrey),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.cartDataModel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: (){
                    widget.removeItemCart(widget.cartDataModel);
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
                        widget.cartDataModel.image,
                        height: 64.0,
                        width: 55.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 7.0),
                          child: Text(
                            widget.cartDataModel.name,
                            style: TextStyle(
                              color: klikBlack,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 9.0),
                          child: Text(
                            "Rp ${widget.cartDataModel.price}/kg",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: klikBlack,
                            ),
                          ),
                        ),
                        Container(
                          child: RatingBar.builder(
                            itemSize: 14.0,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(right: 3.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _decrementValuePrice();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 12.0),
                          width: 30,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: klikGreen),
                          ),
                          child: Center(child: Text("-")),
                        ),
                      ),
                      Container(
                        child: Text(valueCount.toString()),
                      ),
                      GestureDetector(
                        onTap: () {
                          _incrementValuePrice();
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 12.0),
                          width: 30,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: klikGreen),
                          ),
                          child: Center(child: Text("+")),
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
