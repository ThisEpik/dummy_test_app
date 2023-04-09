import 'package:dummy_app/data/models/user_info_model.dart';
import 'package:dummy_app/ui/pages/user_detail_info/user_detail_info_service.dart';
import 'package:dummy_app/ui/widgets/custom_list_tile.dart';
import 'package:dummy_app/ui/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';

class UserDetailPage extends StatelessWidget {
  final String userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDetailInfoService(userId: userId),
      lazy: false,
      child: Scaffold(
        appBar: const UserDetailInfoAppBar(),
        body: Consumer<UserDetailInfoService>(
          builder: (context, service, _) {
            if (service.isLoading) return const CustomLoadingIndicator();

            final UserInfoModel user = service.userInfo;

            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const UserDetailInfoAvatar(),
                CustomListTile(
                  hintText: 'Id:',
                  valueText: user.id,
                ),
                CustomListTile(
                  hintText: 'Title:',
                  valueText: user.title,
                ),
                CustomListTile(
                  hintText: 'Gender:',
                  valueText: user.gender,
                ),
                CustomListTile(
                  hintText: 'Email:',
                  valueText: user.email,
                ),
                CustomListTile(
                  hintText: 'Birth day:',
                  valueText: user.dateOfBirth,
                ),
                CustomListTile(
                  hintText: 'Phone:',
                  valueText: user.phone,
                ),
                CustomListTile(
                  hintText: 'Register date:',
                  valueText: user.registerDate,
                ),
                CustomListTile(
                  hintText: 'Updated date:',
                  valueText: user.updatedDate,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
