import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfert/domain/repositories/settings_repository.dart';
import 'package:transfert/domain/repositories/settings_repository_impl.dart';
import 'package:transfert/domain/usecases/settings_usecase.dart';
import 'package:transfert/presentation/pages/bloc/settings_bloc.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  
  factory ServiceLocator() => _instance;
  
  ServiceLocator._internal();

  Future<void> initialize() async {
    // Register SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);

    // Register Repository
    getIt.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(getIt<SharedPreferences>()),
    );

    // Register UseCases
    getIt.registerLazySingleton<SettingsUseCases>(
      () => SettingsUseCases(getIt<SettingsRepository>()),
    );

    // Register Bloc
    getIt.registerFactory<SettingsBloc>(
      () => SettingsBloc(getIt<SettingsUseCases>()),
    );
  }
}