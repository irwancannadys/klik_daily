import 'package:flutter/material.dart';
import 'package:klik_daily/colors/klik_color.dart';
import 'package:klik_daily/data/fruit_cart.dart';
import 'package:klik_daily/database/klik_daily_database.dart';
import 'package:klik_daily/feature/home/home_main_view_model.dart';
import 'package:klik_daily/feature/home/item_product.dart';
import 'package:klik_daily/repository/repository.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Repository repo = Provider.of(context, listen: false);
    return HomeMainView(repository: repo);
  }
}

class HomeMainView extends StatefulWidget {
  const HomeMainView({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  _HomeMainViewState createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  final dbHelper = CartDataBase.instance;

  late List<FruitCart> fruitCart;

  bool isClickedApple = true;
  bool isClickedOrange = false;
  bool isClickedBanana = false;

  void pickOrange() {
    setState(() {
      isClickedOrange = true;
      isClickedApple = false;
      isClickedBanana = false;
    });
  }

  void pickApple() {
    setState(() {
      isClickedApple = true;
      isClickedOrange = false;
      isClickedBanana = false;
    });
  }

  void pickBanana() {
    setState(() {
      isClickedBanana = true;
      isClickedApple = false;
      isClickedOrange = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeMainViewModel>.reactive(
        builder: (ctx, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 35.0, left: 35.0, top: 35.0, bottom: 4.0),
                child: Column(
                  children: [
                    _headerTitleProfileSection(viewModel),
                    _contentFilterSection(isClickedApple, isClickedOrange,
                        isClickedBanana, viewModel),
                    Expanded(child: _listProductSection(viewModel)),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () =>
            HomeMainViewModel(repository: widget.repository),
        onModelReady: (HomeMainViewModel viewModel) async {
          await viewModel.getListFruitsApple();
          await viewModel.getUser();
        });
  }

  Widget _headerTitleProfileSection(HomeMainViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Find ",
                style: TextStyle(fontSize: 24.0, color: klikYellow),
              ),
              Text(
                "Fresh Groceries",
                style: TextStyle(fontSize: 24.0, color: klikGreen),
              ),
            ],
          ),
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
              viewModel.imagePicture,
            ),
          )
        ],
      ),
    );
  }

  Widget _contentFilterSection(bool isclickedApple, bool isClickedOrange,
      bool isClickedBanana, HomeMainViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: klikGreen,
              ),
              hintText: 'Search Groceries',
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: klikGrey, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: klikGrey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: klikGreen, width: 1.0),
              ),
            ),
            onChanged: (value) {
              // do something
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 21.0, bottom: 21.0),
            child: const Text(
              "Categories",
              style: TextStyle(fontSize: 14.0, color: klikBlack),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 27.0),
                child: TextButton(
                  onPressed: () async {
                    pickApple();
                    await viewModel.getListFruitsApple();
                  },
                  child: Text(
                    "Apple",
                    style: TextStyle(
                        color:
                            isclickedApple == true ? klikWhite : klikGreyText),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(klikGreen),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        isclickedApple == true ? klikGreen : klikGrey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color:
                                isclickedApple == true ? klikGreen : klikGrey),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 27.0),
                child: TextButton(
                  onPressed: () async {
                    pickOrange();
                    await viewModel.getListFruitsOrange();
                  },
                  child: Text(
                    "Orange",
                    style: TextStyle(
                        color:
                            isClickedOrange == true ? klikWhite : klikGreyText),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(klikGreen),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        isClickedOrange == false ? klikGrey : klikGreen),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color:
                                isClickedOrange == true ? klikGreen : klikGrey),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 27.0),
                child: TextButton(
                  onPressed: () async {
                    pickBanana();
                    await viewModel.getListFruitsBanana();
                  },
                  child: Text(
                    "Banana",
                    style: TextStyle(
                        color:
                            isClickedBanana == true ? klikWhite : klikGreyText),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(klikGreen),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        isClickedBanana == true ? klikGreen : klikGrey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color:
                                isClickedBanana == true ? klikGreen : klikGrey),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _listProductSection(HomeMainViewModel viewModel) {
    var listFruits = viewModel.listFruit;
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ItemProduct(
          fruitData: listFruits[index],
          onPressedBuy: (fruitData) {
            insertToShopCart(fruitData.name, fruitData.image, fruitData.price,
                fruitData.ratting);
            print(fruitData.name);
          },
        );
      },
      itemCount: listFruits.length,
    );
  }

  void insertToShopCart(
      String name, String image, int price, int rating) async {
    var fruitCart = FruitCart(
      name: name,
      image: image,
      price: price,
      ratting: rating,
    );
    await dbHelper.create(fruitCart);
  }
}
