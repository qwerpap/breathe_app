import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/breathe_screen/view/breathe_screen.dart';
import 'package:breathe_app/features/exercises_screen/view/exercises_screen.dart';
import 'package:breathe_app/features/history_screen/view/history_screen.dart';
import 'package:breathe_app/features/menu_screen/widgets/language_dropdown.dart';
import 'package:breathe_app/features/menu_screen/widgets/menu_app_bar.dart';
import 'package:breathe_app/features/menu_screen/widgets/menu_card.dart';
import 'package:breathe_app/features/menu_screen/widgets/other_menu_card.dart';
import 'package:breathe_app/features/more_screen/view/more_screen.dart';
import 'package:breathe_app/features/settings_screen/view/settings_screen.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            MenuAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LanguageDropdown(),
                  OtherMenuCard(
                    title: S.of(context).settings,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  OtherMenuCard(
                    title: S.of(context).more,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MoreScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  MenuCard(
                    title: S.of(context).breathe,
                    svg: ImageSource.logoSvg,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BreatheScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  MenuCard(
                    title: S.of(context).exercises,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExercisesScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  MenuCard(
                    title: S.of(context).history,
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
