import 'package:dummy_app/ui/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const CustomNetworkImage(
      {super.key, required this.url, this.width = 50, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const CustomLoadingIndicator();
        },
      ),
    );
  }
}
