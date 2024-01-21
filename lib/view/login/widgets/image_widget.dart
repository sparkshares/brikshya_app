import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_app/resources/assets/images_assets.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(ImageAssets.appLogo),
      height: 150,
    );
  }
}
