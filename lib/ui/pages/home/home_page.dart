import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'home_page_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageService(context: context),
      child: const Scaffold(
        appBar: HomePageAppBar(),
        body: HomePageContent(),
      ),
    );
  }
}
