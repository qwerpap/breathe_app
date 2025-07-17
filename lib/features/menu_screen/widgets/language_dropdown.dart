import 'package:breathe_app/main.dart';
import 'package:flutter/material.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  static const supportedLocales = {
    'EN': Locale('en'),
    'SPA': Locale('es'),
    'DE': Locale('de'),
    'FR': Locale('fr'),
    'RU': Locale('ru'),
  };

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    String currentLanguageCode =
        supportedLocales.entries
            .firstWhere(
              (entry) => entry.value.languageCode == currentLocale.languageCode,
              orElse: () => const MapEntry('EN', Locale('en')),
            )
            .key;

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: currentLanguageCode,
        items:
            supportedLocales.keys.map((lang) {
              return DropdownMenuItem<String>(value: lang, child: Text(lang));
            }).toList(),
        onChanged: (selectedLang) async {
          if (selectedLang != null) {
            final locale = supportedLocales[selectedLang]!;

            // Сохраняем выбранный язык
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('locale', locale.languageCode);

            // Загружаем язык
            await S.load(locale);

            // Перезапускаем (или перерисовываем) приложение
            MyApp.setLocale(context, locale);
          }
        },
      ),
    );
  }
}
