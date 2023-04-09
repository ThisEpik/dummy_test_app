import 'package:dio/dio.dart';
import 'package:dummy_app/data/global_constants/api_data.dart';
import 'package:dummy_app/data/models/user_model.dart';
import 'package:dummy_app/data/utils/custom_dio.dart';

class GetUsersRequest {
  Future<List<UserModel>> get(int page) async {
    final String url = '${ApiData.baseUrl}/user?page=$page';
    final Response? response = await CustomDio.get(url);

    return UserModel.getModelFromList(response?.data['data'] ?? []);
  }
}
