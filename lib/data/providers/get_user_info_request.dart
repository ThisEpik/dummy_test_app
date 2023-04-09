import 'package:dio/dio.dart';
import 'package:dummy_app/data/global_constants/api_data.dart';
import 'package:dummy_app/data/models/user_info_model.dart';
import 'package:dummy_app/data/utils/custom_dio.dart';

class GetUserInfoRequest {
  Future<UserInfoModel> get(String userId) async {
    final String url = '${ApiData.baseUrl}/user/$userId';
    final Response? response = await CustomDio.get(url);

    return UserInfoModel.fromMap(response!.data);
  }
}
