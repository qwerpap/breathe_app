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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `goodbye`
  String get goodbye {
    return Intl.message(
      'goodbye',
      name: 'goodbye',
      desc: '',
      args: [],
    );
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Breathe`
  String get breathe {
    return Intl.message(
      'Breathe',
      name: 'breathe',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercises {
    return Intl.message(
      'Exercises',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `inhale`
  String get inhale {
    return Intl.message(
      'inhale',
      name: 'inhale',
      desc: '',
      args: [],
    );
  }

  /// `exhale`
  String get exhale {
    return Intl.message(
      'exhale',
      name: 'exhale',
      desc: '',
      args: [],
    );
  }

  /// `hold`
  String get hold {
    return Intl.message(
      'hold',
      name: 'hold',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Tap to start',
      name: 'tapToStart',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get sounds {
    return Intl.message(
      'Sounds',
      name: 'sounds',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Haptics',
      name: 'haptics',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Report a Bag`
  String get reportABag {
    return Intl.message(
      'Report a Bag',
      name: 'reportABag',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Well Done!`
  String get wellDone {
    return Intl.message(
      'Well Done!',
      name: 'wellDone',
      desc: '',
      args: [],
    );
  }

  /// `Again`
  String get again {
    return Intl.message(
      'Again',
      name: 'again',
      desc: '',
      args: [],
    );
  }

  /// `4‑7‑8`
  String get technique_478_name {
    return Intl.message(
      '4‑7‑8',
      name: 'technique_478_name',
      desc: '',
      args: [],
    );
  }

  /// `Simple yet powerful for unwinding, lowering stress, and supporting sleep. Balances your breathing pattern and activates the parasympathetic response to counter stress.\nPattern: Inhale 4s → Hold 7s → Exhale 8s.\nRepeat: 5 cycles.\nTotal time: ~1m 35s.`
  String get technique_478_description {
    return Intl.message(
      'Simple yet powerful for unwinding, lowering stress, and supporting sleep. Balances your breathing pattern and activates the parasympathetic response to counter stress.\nPattern: Inhale 4s → Hold 7s → Exhale 8s.\nRepeat: 5 cycles.\nTotal time: ~1m 35s.',
      name: 'technique_478_description',
      desc: '',
      args: [],
    );
  }

  /// `1:2`
  String get technique_12_name {
    return Intl.message(
      '1:2',
      name: 'technique_12_name',
      desc: '',
      args: [],
    );
  }

  /// `A short inhale followed by an exhale twice as long gently engages the parasympathetic system and encourages relaxation. Useful under stress and before sleep.\nPattern: Inhale 4s → Exhale 8s.\nRepeat: 8 cycles.\nTotal time: ~1m 36s.`
  String get technique_12_description {
    return Intl.message(
      'A short inhale followed by an exhale twice as long gently engages the parasympathetic system and encourages relaxation. Useful under stress and before sleep.\nPattern: Inhale 4s → Exhale 8s.\nRepeat: 8 cycles.\nTotal time: ~1m 36s.',
      name: 'technique_12_description',
      desc: '',
      args: [],
    );
  }

  /// `Rectangle Breathing`
  String get technique_rectangle_name {
    return Intl.message(
      'Rectangle Breathing',
      name: 'technique_rectangle_name',
      desc: '',
      args: [],
    );
  }

  /// `Longer inhales/exhales paired with brief breath‑holds help even out your breathing, ease tension, and support steady focus. A good steadying rhythm in challenging moments.\nPattern: Inhale 6s → Hold 3s → Exhale 6s → Hold 3s.\nRepeat: 5 cycles.\nTotal time: ~1m 30s.`
  String get technique_rectangle_description {
    return Intl.message(
      'Longer inhales/exhales paired with brief breath‑holds help even out your breathing, ease tension, and support steady focus. A good steadying rhythm in challenging moments.\nPattern: Inhale 6s → Hold 3s → Exhale 6s → Hold 3s.\nRepeat: 5 cycles.\nTotal time: ~1m 30s.',
      name: 'technique_rectangle_description',
      desc: '',
      args: [],
    );
  }

  /// `Ujjayi`
  String get technique_ujjayi_name {
    return Intl.message(
      'Ujjayi',
      name: 'technique_ujjayi_name',
      desc: '',
      args: [],
    );
  }

  /// `A traditional yogic method: slow nasal breathing with a light throat constriction that creates a soothing “ocean” sound. Deepens relaxation, sharpens concentration, and syncs breath with movement in yoga—great when you need to ground yourself.\nPattern: Inhale 5s → Exhale 5s.\nRepeat: 10 cycles.\nTotal time: ~1m 40s.`
  String get technique_ujjayi_description {
    return Intl.message(
      'A traditional yogic method: slow nasal breathing with a light throat constriction that creates a soothing “ocean” sound. Deepens relaxation, sharpens concentration, and syncs breath with movement in yoga—great when you need to ground yourself.\nPattern: Inhale 5s → Exhale 5s.\nRepeat: 10 cycles.\nTotal time: ~1m 40s.',
      name: 'technique_ujjayi_description',
      desc: '',
      args: [],
    );
  }

  /// `Box Breathing`
  String get technique_box_name {
    return Intl.message(
      'Box Breathing',
      name: 'technique_box_name',
      desc: '',
      args: [],
    );
  }

  /// `Equal lengths for inhale, hold, exhale, hold. Stabilizes rhythm, calms the nervous system, and helps you regain control and concentration in stressful situations. The steady tempo feels meditative.\nPattern: Inhale 4s → Hold 4s → Exhale 4s → Hold 4s.\nRepeat: 5 cycles.\nTotal time: ~1m 20s.`
  String get technique_box_description {
    return Intl.message(
      'Equal lengths for inhale, hold, exhale, hold. Stabilizes rhythm, calms the nervous system, and helps you regain control and concentration in stressful situations. The steady tempo feels meditative.\nPattern: Inhale 4s → Hold 4s → Exhale 4s → Hold 4s.\nRepeat: 5 cycles.\nTotal time: ~1m 20s.',
      name: 'technique_box_description',
      desc: '',
      args: [],
    );
  }

  /// `Google Sign-In failed`
  String get googleSigninFailed {
    return Intl.message(
      'Google Sign-In failed',
      name: 'googleSigninFailed',
      desc: '',
      args: [],
    );
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
