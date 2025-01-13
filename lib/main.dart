import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/core/theme/app_theme.dart';
import 'package:transfert/di/injection.dart';
import 'package:transfert/presentation/pages/bloc/historical_price_bloc.dart';
import 'package:transfert/presentation/pages/bloc/money_transfert_bloc.dart';
import 'package:transfert/presentation/pages/bloc/settings_bloc.dart';
import 'package:transfert/presentation/pages/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().initialize();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) => getIt<SettingsBloc>()..add(LoadSettingsEvent())),
    BlocProvider(
        create: (context) => getIt<MoneyTransferBloc>()..add(LoadDataEvent())),
    BlocProvider(
        create: (context) =>
            getIt<HistoricalPriceBloc>()..add(FetchHistoricalPrices()))
  ], child: MyApp())
      /* BlocProvider(
      create: (context) => getIt<SettingsBloc>()..add(LoadSettingsEvent()),
      child:  MyApp(),
    ), */
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Mon App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state is SettingsLoaded && state.settings.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          home: LoginPage(),
        );
      },
    );
  }
}
