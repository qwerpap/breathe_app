import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/history_screen/view/history_screen.dart';
import 'package:breathe_app/features/menu_screen/widgets/lang_card.dart';
import 'package:breathe_app/features/menu_screen/widgets/menu_app_bar.dart';
import 'package:breathe_app/features/menu_screen/widgets/menu_card.dart';
import 'package:breathe_app/features/menu_screen/widgets/other_menu_card.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            MenuAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LangCard(onPressed: () {}),
                  OtherMenuCard(
                    title: S.of(context).settings,
                    onPressed: () {},
                  ),
                  OtherMenuCard(title: S.of(context).more, onPressed: () {}),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  MenuCard(
                    title: 'Breathe',
                    svg: ImageSource.logoSvg,
                    onPressed: () {},
                  ),
                  SizedBox(height: 16),
                  MenuCard(title: 'Exercises', onPressed: () {}),
                  SizedBox(height: 16),
                  MenuCard(
                    title: 'History',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
