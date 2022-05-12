
import 'package:klik_daily/model/user_response.dart';
import 'package:klik_daily/service/api_service.dart';

class Repository {
  final ApiService remoteDataSource;

  Repository(this.remoteDataSource);

  Future<UserResponse?> userResponse() async {
    return await remoteDataSource.getUserResponse();
  }
}