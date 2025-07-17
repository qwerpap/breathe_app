import 'package:breathe_app/constants/image_source.dart';
import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageSource.menuBg,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      fit: BoxFit.cover,
    );
  }
}
