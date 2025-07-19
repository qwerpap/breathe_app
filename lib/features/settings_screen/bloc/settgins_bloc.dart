import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsState {
  final bool sounds;
  final bool notifications;
  final bool haptics;

  const SettingsState({
    required this.sounds,
    required this.notifications,
    required this.haptics,
  });

  SettingsState copyWith({
    bool? sounds,
    bool? notifications,
    bool? haptics,
  }) {
    return SettingsState(
      sounds: sounds ?? this.sounds,
      notifications: notifications ?? this.notifications,
      haptics: haptics ?? this.haptics,
    );
  }
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
          sounds: true, // включено по умолчанию
          notifications: false,
          haptics: true,
        ));

  void toggleSounds(bool value) => emit(state.copyWith(sounds: value));
  void toggleNotifications(bool value) => emit(state.copyWith(notifications: value));
  void toggleHaptics(bool value) => emit(state.copyWith(haptics: value));
}
