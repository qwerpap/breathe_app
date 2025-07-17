import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/features/history_screen/widget/custom_app_bar.dart';
import 'package:breathe_app/features/more_screen/widget/more_card.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: S.of(context).more),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            MoreCard(title: S.of(context).share, onPressed: () {}),
            Divider(),
            MoreCard(title: S.of(context).review, onPressed: () {}),
            Divider(),
            MoreCard(title: S.of(context).contacts, onPressed: () {}),
            Divider(),
            MoreCard(title: S.of(context).reportABag, onPressed: () {}),
            Divider(),
            MoreCard(title: S.of(context).website, onPressed: () {}),
            SizedBox(height: 26),
            Text(
              '${AppConstants.nameApp} ${AppConstants.versionApp}v',
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
