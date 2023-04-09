import 'package:dummy_app/ui/pages/home/home_page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final HomePageService service = context.read<HomePageService>();

    return AppBar(
      centerTitle: true,
      title: const Text('Dummy test app'),
      actions: [
        IconButton(
          onPressed: () => service.getUsers(isRefresh: true),
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: service.clearUsers,
          icon: const Icon(Icons.clear_all),
        )
      ],
    );
  }
}
