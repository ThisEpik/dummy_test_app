import 'package:dummy_app/ui/pages/home/home_page_service.dart';
import 'package:dummy_app/ui/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePagePaginLoadingIndicator extends StatelessWidget {
  const HomePagePaginLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageService service = context.watch();

    return Visibility(
        visible: service.isPagingLoading,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: CustomLoadingIndicator(),
        ));
  }
}
