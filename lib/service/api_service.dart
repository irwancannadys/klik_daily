import 'package:dio/dio.dart';
import 'package:klik_daily/model/user_response.dart';
import 'package:klik_daily/service/contant_url.dart';

import 'dio/dio_client.dart';

class ApiService {
  final DioClient dioClient;

  ApiService(this.dioClient);

  Future<UserResponse?> getUserResponse() async {
    UserResponse? userResponse;
    try {
      Response response = await dioClient.dio.get(Constant.PROFILE_END_POINT);
      userResponse = UserResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return userResponse;
  }
}
