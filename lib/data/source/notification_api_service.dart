import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dio_client.dart';
import '../../service_locator.dart';
import '../../util/api_urls.dart';

abstract class NotificationApiService {

  Future<Either> getAllNotifications();
  Future<Either> markAllNotifications();
  Future<Either> markNotificationById(int id);
}

class NotificationServiceImpl extends NotificationApiService {

  @override
  Future<Either> getAllNotifications() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().get(
        ApiUrls.getAllNotification,
        options: Options(
            headers: {
              'Authorization' : 'Bearer $token '
            }
        ),
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> markAllNotifications() async{
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().patch(
        ApiUrls.markAllNotification,
        options: Options(
            headers: {
              'Authorization' : 'Bearer $token '
            }
        ),
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> markNotificationById(int id) async{
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().patch(
        "${ApiUrls.markNotificationById}/$id",
        options: Options(
            headers: {
              'Authorization' : 'Bearer $token '
            },
        ),
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}