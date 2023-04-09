// ignore_for_file: unnecessary_type_check

import 'package:dummy_app/data/models/user_info_model.dart';
import 'package:dummy_app/data/models/user_model.dart';
import 'package:dummy_app/data/providers/get_user_info_request.dart';
import 'package:dummy_app/data/providers/get_users_request.dart';
import 'package:test/test.dart';

void main() {
  test('Check arrived data from get user info request', () async {
    final GetUserInfoRequest request = GetUserInfoRequest();
    final UserInfoModel user = await request.get('60d0fe4f5311236168a109ca');
    expect(true, user is UserInfoModel);
  });

  test('Check arrived data from get users request', () async {
    final GetUsersRequest request = GetUsersRequest();
    final List<UserModel> users = await request.get(0);
    expect(true, users.isNotEmpty);
  });
}
