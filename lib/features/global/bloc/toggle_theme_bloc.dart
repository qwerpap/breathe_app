import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:breathe_app/theme/theme.dart';

abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

class ThemeState {
  final ThemeData themeData;
  final bool isDark;

  ThemeState({required this.themeData, required this.isDark});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required ThemeData initialTheme, required bool isDark})
    : super(ThemeState(themeData: initialTheme, isDark: isDark)) {
    on<ToggleThemeEvent>((event, emit) async {
      final newIsDark = !state.isDark;
      final newTheme = newIsDark ? darktTheme : lightTheme;

      // Сохраняем выбор
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkTheme', newIsDark);

      emit(ThemeState(themeData: newTheme, isDark: newIsDark));
    });
  }
}
