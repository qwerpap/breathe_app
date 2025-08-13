import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/menu_screen/view/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewAppBar extends StatelessWidget {
  const WebViewAppBar({
    super.key,
    required WebViewController controller,
    required this.mounted,
  }) : _controller = controller;

  final WebViewController _controller;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        InkWell(
          onTap: () async {
            if (await _controller.canGoBack()) {
              _controller.goBack();
            } else {
              if (!mounted) return;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const MenuScreen()),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SvgPicture.asset(
              ImageSource.arrowBack,
              height: 25,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
