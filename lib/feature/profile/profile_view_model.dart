
import 'package:flutter/foundation.dart';
import 'package:klik_daily/model/user_response.dart';
import 'package:klik_daily/repository/repository.dart';

class ProfileViewModel extends ChangeNotifier {
  final Repository repository;

  ProfileViewModel({required this.repository});

  String title = "";
  String firstName = "";
  String lastName = "";
  String username = "";
  String email = "";
  String phone = "";
  String location = "";
  String image = "";

  Future<void> getUser() async {
    var response = await repository.userResponse();
    if(response != null) {
      image = response.results?[0].picture?.medium ?? "";

      title = response.results?[0].name?.title ?? "";
      firstName = response.results?[0].name?.first ?? "";
      lastName = response.results?[0].name?.last ?? "";
      username = "$title $firstName $lastName";

      email = response.results?[0].email ?? "";
      phone = response.results?[0].phone ?? "";
      location = response.results?[0].location?.city ?? "";
    }
    notifyListeners();
  }
}