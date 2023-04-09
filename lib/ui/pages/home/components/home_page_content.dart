import 'package:dummy_app/data/models/user_model.dart';
import 'package:dummy_app/ui/pages/home/components/components.dart';
import 'package:dummy_app/ui/pages/home/home_page_service.dart';
import 'package:dummy_app/ui/widgets/custom_loading_indicator.dart';
import 'package:dummy_app/ui/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageService service = context.watch<HomePageService>();

    if (service.isFirstLoading) return const CustomLoadingIndicator();

    return Visibility(
      visible: service.hasUsers,
      replacement: const Center(
        child: Text('Users is empty'),
      ),
      child: ListView.builder(
        controller: service.scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: service.users.length + 1,
        itemBuilder: (context, index) {
          if (index == service.users.length) {
            return const HomePagePaginLoadingIndicator();
          }
          final UserModel user = service.users[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () => service.goToUserDetailPage(user.id),
              leading: CustomNetworkImage(url: user.picture),
              title: Text('${user.title} ${user.firstName} ${user.lastName}'),
            ),
          );
        },
      ),
    );
  }
}
