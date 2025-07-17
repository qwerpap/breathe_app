// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `goodbye`
  String get goodbye {
    return Intl.message('goodbye', name: 'goodbye', desc: '', args: []);
  }

  /// `hello`
  String get hello {
    return Intl.message('hello', name: 'hello', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Breathe`
  String get breathe {
    return Intl.message('Breathe', name: 'breathe', desc: '', args: []);
  }

  /// `Exercises`
  String get exercises {
    return Intl.message('Exercises', name: 'exercises', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `inhale`
  String get inhale {
    return Intl.message('inhale', name: 'inhale', desc: '', args: []);
  }

  /// `exhale`
  String get exhale {
    return Intl.message('exhale', name: 'exhale', desc: '', args: []);
  }

  /// `hold`
  String get hold {
    return Intl.message('hold', name: 'hold', desc: '', args: []);
  }

  /// `No history yet`
  String get noHistoryYet {
    return Intl.message(
      'No history yet',
      name: 'noHistoryYet',
      desc: '',
      args: [],
    );
  }

  /// `Clear History`
  String get clearHistory {
    return Intl.message(
      'Clear History',
      name: 'clearHistory',
      desc: '',
      args: [],
    );
  }

  /// `The history is available\nonly to authorized users`
  String get theHistoryIsAvailablenonlyToAuthorizedUsers {
    return Intl.message(
      'The history is available\\nonly to authorized users',
      name: 'theHistoryIsAvailablenonlyToAuthorizedUsers',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `Select breathing Technique`
  String get selectBreathingTechnique {
    return Intl.message(
      'Select breathing Technique',
      name: 'selectBreathingTechnique',
      desc: '',
      args: [],
    );
  }

  /// `{seconds} секунд`
  String countdown(Object seconds) {
    return Intl.message(
      '$seconds секунд',
      name: 'countdown',
      desc: '',
      args: [seconds],
    );
  }

  /// `Tap to start`
  String get tapToStart {
    return Intl.message('Tap to start', name: 'tapToStart', desc: '', args: []);
  }

  /// `Start Breathe`
  String get startBreathe {
    return Intl.message(
      'Start Breathe',
      name: 'startBreathe',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message('Dark theme', name: 'darkTheme', desc: '', args: []);
  }

  /// `Sounds`
  String get sounds {
    return Intl.message('Sounds', name: 'sounds', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Haptics`
  String get haptics {
    return Intl.message('Haptics', name: 'haptics', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Contacts`
  String get contacts {
    return Intl.message('Contacts', name: 'contacts', desc: '', args: []);
  }

  /// `Report a Bag`
  String get reportABag {
    return Intl.message('Report a Bag', name: 'reportABag', desc: '', args: []);
  }

  /// `Website`
  String get website {
    return Intl.message('Website', name: 'website', desc: '', args: []);
  }

  /// `Well Done!`
  String get wellDone {
    return Intl.message('Well Done!', name: 'wellDone', desc: '', args: []);
  }

  /// `Again`
  String get again {
    return Intl.message('Again', name: 'again', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'spa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
