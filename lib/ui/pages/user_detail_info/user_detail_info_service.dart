import 'package:dummy_app/data/models/user_info_model.dart';
import 'package:dummy_app/data/providers/get_user_info_request.dart';
import 'package:flutter/material.dart';

class UserDetailInfoService extends ChangeNotifier {
  final String userId;

  final GetUserInfoRequest _userInfoRequest = GetUserInfoRequest();
  late final UserInfoModel userInfo;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  UserDetailInfoService({required this.userId}) {
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    userInfo = await _userInfoRequest.get(userId);
    _isLoading = false;
    notifyListeners();
  }
}
