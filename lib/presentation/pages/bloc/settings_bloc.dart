import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/domain/entities/settings.dart';
import 'package:transfert/domain/usecases/settings_usecase.dart';

// Events
abstract class SettingsEvent {}

class LoadSettingsEvent extends SettingsEvent {}

class ToggleGoogleAuthEvent extends SettingsEvent {
  final bool enabled;
  ToggleGoogleAuthEvent(this.enabled);
}

class ChangeLanguageEvent extends SettingsEvent {
  final String language;
  ChangeLanguageEvent(this.language);
}

// States
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final Settings settings;
  SettingsLoaded(this.settings);
}

class SettingsError extends SettingsState {
  final String message;
  SettingsError(this.message);
}

class ToggleDarkModeEvent extends SettingsEvent {
  final bool enabled;
  ToggleDarkModeEvent(this.enabled);
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsUseCases useCases;

  SettingsBloc(this.useCases) : super(SettingsInitial()) {
    on<LoadSettingsEvent>(_onLoadSettings);
    on<ToggleGoogleAuthEvent>(_onToggleGoogleAuth);
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<ToggleDarkModeEvent>(_onToggleDarkMode); // Ajouter le handler
  }

  Future<void> _onToggleDarkMode(
      ToggleDarkModeEvent event, Emitter<SettingsState> emit) async {
    try {
      await useCases.repository.toggleDarkMode(event.enabled);
      add(LoadSettingsEvent());
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onLoadSettings(
      LoadSettingsEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoading());
    try {
      final settings = await useCases.getSettings();
      emit(SettingsLoaded(settings));
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onToggleGoogleAuth(
      ToggleGoogleAuthEvent event, Emitter<SettingsState> emit) async {
    try {
      await useCases.toggleGoogleAuth(event.enabled);
      add(LoadSettingsEvent());
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onChangeLanguage(
      ChangeLanguageEvent event, Emitter<SettingsState> emit) async {
    try {
      await useCases.changeLanguage(event.language);
      add(LoadSettingsEvent());
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }
}
