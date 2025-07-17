import 'package:breathe_app/features/global/bloc/toggle_theme_bloc.dart';
import 'package:breathe_app/features/settings_screen/bloc/settgins_bloc.dart';
import 'package:breathe_app/features/settings_screen/widget/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:breathe_app/features/history_screen/widget/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // делает фон статус-бара прозрачным
        statusBarIconBrightness:
            Brightness.light, // иконки светлые (на тёмном фоне)
      ),
    );
    final isDark = context.watch<ThemeBloc>().state.isDark;
    final settings = context.watch<SettingsCubit>().state;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: S.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Divider(),
            SettingsCard(
              title: S.of(context).darkTheme,
              isDarkTheme: isDark,
              value: isDark,
              onChanged: (_) {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
            ),
            const Divider(),
            SettingsCard(
              title: S.of(context).sounds,
              isDarkTheme: isDark,
              value: settings.sounds,
              onChanged: (value) {
                context.read<SettingsCubit>().toggleSounds(value);
              },
            ),
            const Divider(),
            SettingsCard(
              title: S.of(context).notifications,
              isDarkTheme: isDark,
              value: settings.notifications,
              onChanged: (value) {
                context.read<SettingsCubit>().toggleNotifications(value);
              },
            ),
            const Divider(),
            SettingsCard(
              title: S.of(context).haptics,
              isDarkTheme: isDark,
              value: settings.haptics,
              onChanged: (value) {
                context.read<SettingsCubit>().toggleHaptics(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
