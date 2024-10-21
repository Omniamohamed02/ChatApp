import 'package:flutter/material.dart';

import '../../../../../core/constant/asset_images.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topCenter,
        width: 300 ,
        height: 250,
        child: Image.asset(AssetImages.logo),
      );
  }
}
