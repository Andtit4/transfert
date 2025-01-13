import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfert/data/datasources/price_data_source.dart';
import 'package:transfert/data/datasources/profile_datasource.dart';
import 'package:transfert/domain/repositories/money_transfert_repository.dart';
import 'package:transfert/domain/repositories/money_transfert_repository_impl.dart';
import 'package:transfert/domain/repositories/price_reposiory_impl.dart';
import 'package:transfert/domain/repositories/price_repository.dart';
import 'package:transfert/domain/repositories/profile_repository.dart';
import 'package:transfert/domain/repositories/profile_repository_impl.dart';
import 'package:transfert/domain/repositories/settings_repository.dart';
import 'package:transfert/domain/repositories/settings_repository_impl.dart';
import 'package:transfert/domain/usecases/get_historical_prices_usecase.dart';
import 'package:transfert/domain/usecases/money_transfert_usecase.dart';
import 'package:transfert/domain/usecases/profile_usecase.dart';
import 'package:transfert/domain/usecases/settings_usecase.dart';
import 'package:transfert/domain/usecases/update_preferenc_usecase.dart';
import 'package:transfert/presentation/pages/bloc/historical_price_bloc.dart';
import 'package:transfert/presentation/pages/bloc/money_transfert_bloc.dart';
import 'package:transfert/presentation/pages/bloc/profile_bloc.dart';
import 'package:transfert/presentation/pages/bloc/settings_bloc.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  factory ServiceLocator() => _instance;

  ServiceLocator._internal();

  Future<void> initialize() async {
    // Register SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    final rep = ProfileRepository;
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
    getIt.registerSingleton<PriceDataSource>(PriceDataSourceImpl());
    getIt.registerSingleton<ProfileDataSource>(ProfileDataSourceImpl());
    
  getIt.registerLazySingleton<UpdatePreferenceUseCase>(
    () => UpdatePreferenceUseCaseImpl(getIt<ProfileRepository>()),
  );

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

    // Register Repository
    getIt.registerLazySingleton<MoneyTransferRepository>(
      () => MoneyTransfertRepositoryImpl(),
    );

    // Register MoneyTransfer useCases
    getIt.registerLazySingleton<MoneyTransferUseCases>(
        () => MoneyTransferUseCases(getIt<MoneyTransferRepository>()));

    getIt.registerFactory<MoneyTransferBloc>(
      () => MoneyTransferBloc(getIt<MoneyTransferUseCases>()),
    );

    // Pour Historique
    getIt.registerFactory<PriceRepository>(
      () => PriceReposioryImpl(getIt<PriceDataSource>()),
    );

    getIt.registerLazySingleton<GetHistoricalPricesUseCase>(
      () => GetHistoricalPricesUseCase(getIt<PriceRepository>()),
    );

    getIt.registerFactory<HistoricalPriceBloc>(
      () => HistoricalPriceBloc(getIt<GetHistoricalPricesUseCase>()),
    );

    // Pout setting
    getIt.registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(getIt<ProfileDataSource>()),
    );

    getIt.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(getIt<ProfileRepository>()),
    );
    getIt.registerFactory<ProfileBloc>(
      () => ProfileBloc(
        getProfile: getIt<GetProfileUseCase>(),
        updatePreference: getIt<UpdatePreferenceUseCase>(),
      ),
    );
  }
}
