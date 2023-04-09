import 'package:dummy_app/ui/pages/user_detail_info/user_detail_info_service.dart';
import 'package:dummy_app/ui/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailInfoAvatar extends StatelessWidget {
  const UserDetailInfoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailInfoService service = context.watch();

    return Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CustomNetworkImage(
            url: service.userInfo.picture,
            width: 300,
            height: 300,
          ),
        ));
  }
}
