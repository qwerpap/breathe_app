import 'dart:async';
import 'package:breathe_app/features/global/bloc/toggle_theme_bloc.dart';
import 'package:breathe_app/features/menu_screen/view/menu_screen.dart';
import 'package:breathe_app/features/settings_screen/bloc/settgins_bloc.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:breathe_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Загрузка сохранённой темы
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('isDarkTheme') ?? false;
      final initialTheme = isDark ? darktTheme : lightTheme;

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (_) => ThemeBloc(initialTheme: initialTheme, isDark: isDark),
            ),
            BlocProvider(create: (_) => SettingsCubit()),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      print('Caught error: $error');
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('locale') ?? 'en';
    setState(() {
      _locale = Locale(langCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          locale: _locale, // <- ВАЖНО!
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const MenuScreen(),
        );
      },
    );
  }
}
