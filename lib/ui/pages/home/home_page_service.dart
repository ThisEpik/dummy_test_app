import 'dart:async';

import 'package:dummy_app/data/models/user_model.dart';
import 'package:dummy_app/data/providers/get_users_request.dart';
import 'package:dummy_app/data/utils/debouncer.dart';
import 'package:dummy_app/data/utils/utils.dart';
import 'package:dummy_app/ui/pages/user_detail_info/user_detail_info_page.dart';
import 'package:flutter/material.dart';

class HomePageService extends ChangeNotifier {
  final BuildContext context;
  final GetUsersRequest _usersRequest = GetUsersRequest();
  final ScrollController scrollController = ScrollController();
  final Debouncer _debouncer = Debouncer();

  final List<UserModel> _users = [];
  List<UserModel> get users => _users;

  bool _isFirstLoading = true;
  bool get isFirstLoading => _isFirstLoading;

  bool get hasUsers => _users.isNotEmpty;

  bool _isPagingLoading = false;
  bool get isPagingLoading => _isPagingLoading;

  int _page = 0;

  HomePageService({required this.context}) {
    getUsers();
    _starScrollListener();
  }

  Future<void> getUsers({bool isRefresh = false}) async {
    if (isRefresh) clearUsers();

    _isFirstLoading = true;
    notifyListeners();
    _users.addAll(await _usersRequest.get(_page));
    _isFirstLoading = false;
    notifyListeners();
    _page++;
  }

  void clearUsers() {
    _users.clear();
    _page = 0;
    notifyListeners();
  }

  void goToUserDetailPage(String userId) {
    Utils.push(context, UserDetailPage(userId: userId));
  }

  void _starScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset > scrollController.position.maxScrollExtent) {
        _isPagingLoading = true;
        notifyListeners();
        _debouncer.handle(const Duration(milliseconds: 150), () async {
          await Future.delayed(
              const Duration(milliseconds: 250)); // for smooth animation

          _users.addAll(await _usersRequest.get(_page));
          _page++;
          _isPagingLoading = false;
          notifyListeners();
        });
      }
    });
  }
}
