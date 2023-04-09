import 'package:dummy_app/ui/pages/user_detail_info/user_detail_info_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailInfoAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const UserDetailInfoAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final UserDetailInfoService service =
        context.watch<UserDetailInfoService>();

    return AppBar(
      title: Text(service.isLoading
          ? 'Loading...'
          : '${service.userInfo.firstName} ${service.userInfo.lastName}'),
    );
  }
}
