

import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:klik_daily/data/apple_data.dart';
import 'package:klik_daily/data/banana_data.dart';
import 'package:klik_daily/data/fruit_data.dart';
import 'package:klik_daily/data/orange_data.dart';
import 'package:klik_daily/repository/repository.dart';

class HomeMainViewModel extends ChangeNotifier{

  HomeMainViewModel({required this.repository});

  final Repository repository;

  List<DataApple> dataApple = [];

  List<BananaData> bananaData = [];

  List<OrangeData> orangeData = [];

  bool isClickedButton = true;

  String imagePicture = "";

  List<FruitData> listFruit = [];

  List<FruitData> addValueList() {
    listFruit.add(FruitData("Sweet Apple Indonesia", "assets/apple.png", 20000, 3));
    listFruit.add(FruitData("Sweet Apple Belanda", "assets/apple.png", 50000, 5));
    listFruit.add(FruitData("Sweet Apple Canada", "assets/apple.png", 23000, 2));
    listFruit.add(FruitData("Sweet Apple Indonesia", "assets/apple.png", 20000, 3));
    listFruit.add(FruitData("Sweet Apple India", "assets/apple.png", 10000, 3));
    listFruit.add(FruitData("Sweet Orange India", "assets/oranges.png", 15000, 3));
    listFruit.add(FruitData("Sweet Orange Indonesia", "assets/oranges.png", 20000, 3));
    listFruit.add(FruitData("Sweet Orange Belanda", "assets/oranges.png", 25000, 3));
    listFruit.add(FruitData("Sweet Orange Belgia", "assets/oranges.png", 11000, 3));
    listFruit.add(FruitData("Sweet Orange Italy", "assets/oranges.png", 40000, 3));
    listFruit.add(FruitData("Sweet Orange Germany", "assets/oranges.png", 50000, 3));
    listFruit.add(FruitData("Sweet Banana Philipine", "assets/bananas.png", 60000, 3));
    listFruit.add(FruitData("Sweet Banana USA", "assets/bananas.png", 70000, 4));
    listFruit.add(FruitData("Sweet Banana Korea", "assets/bananas.png", 45000, 3));
    listFruit.add(FruitData("Sweet Banana London", "assets/bananas.png", 55000, 5));
    listFruit.add(FruitData("Sweet Banana Hongkong", "assets/bananas.png", 650000, 2));
    listFruit.add(FruitData("Sweet Banana Swizz", "assets/bananas.png", 100000, 5));
    return listFruit;
  }


  Future<void> getListFruitsApple() async {
    listFruit.clear();
    addValueList();
    listFruit.retainWhere((element){
      return element.name.toLowerCase().contains("Apple".toLowerCase());
    });
  }

  Future<void> getListFruitsOrange() async {
    listFruit.clear();
    addValueList();
    listFruit.retainWhere((element){
      return element.name.toLowerCase().contains("Orange".toLowerCase());
    });
  }

  Future<void> getListFruitsBanana() async {
    listFruit.clear();
    addValueList();
    listFruit.retainWhere((element){
      return element.name.toLowerCase().contains("Banana".toLowerCase());
    });
  }

  Future<void> getUser() async {
    var response = await repository.userResponse();
    if(response != null) {
      imagePicture = response.results?[0].picture?.medium ?? "";
      print(imagePicture);
    }
    notifyListeners();
  }

}