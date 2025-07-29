import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/history_screen/widget/custom_app_bar.dart';
import 'package:breathe_app/features/more_screen/widget/more_card.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

Future<void> _sendEmail({String subject = ''}) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'flowpause.app@gmail.com',
    queryParameters: {'subject': subject},
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch email client';
  }
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
            MoreCard(
              title: S.of(context).share,
              svg: ImageSource.share,
              onPressed: () {
                Share.share(
                  'Try FlowPause for better breathing and relaxation!\n\nDownload now:\nhttps://apps.apple.com/us/app/flowpause/id6748916071',
                  subject: 'Check out FlowPause!',
                );
              },
            ),
            Divider(),
            MoreCard(
              title: S.of(context).contacts,
              svg: ImageSource.contacts,
              iconHeight: 14, // например
              onPressed: () {
                _sendEmail(subject: 'Contact Support');
              },
            ),
            Divider(),
            MoreCard(
              title: S.of(context).reportABag,
              svg: ImageSource.reportBag,
              onPressed: () {
                _sendEmail(subject: 'Bug Report');
              },
            ),
            Divider(),
            MoreCard(
              title: 'Privacy Policy',
              svg: ImageSource.website,
              onPressed: () async {
                const url =
                    'https://docs.google.com/document/d/1sleKj_IYThOmvF1955eFRA8nbdipvmuXwWDSDgdzgsg/edit?usp=sharing';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
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
