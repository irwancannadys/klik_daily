import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/data/fruit_data.dart';
import 'package:klik_daily/utils/price_format.dart';

class ItemProduct extends StatelessWidget {
  FruitData fruitData;

  Function(FruitData) onPressedBuy;


  ItemProduct({required this.fruitData, required this.onPressedBuy});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(top:12.0, left: 6.0, right: 6.0, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: klikGrey),
      ),
      child: Row(
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
                    fruitData.image,
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
                        fruitData.name,
                        style: TextStyle(
                          color: klikBlack,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 9.0),
                      child: Text(
                        CurrencyFormat.convertToIdr(fruitData.price) + '/kg',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: klikBlack,
                        ),
                      ),
                    ),
                    Container(
                      child: RatingBar.builder(
                        itemSize: 18.0,
                        initialRating: fruitData.ratting.toDouble(),
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
            child: TextButton(
              onPressed: () {
                onPressedBuy(fruitData);
              },
              child: const Text(
                "Buy",
                style: TextStyle(color: klikWhite),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(klikGreen),
                backgroundColor: MaterialStateProperty.all<Color>(klikGreen),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: klikGreen),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
