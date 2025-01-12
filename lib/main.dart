import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/core/theme/app_theme.dart';
import 'package:transfert/di/injection.dart';
import 'package:transfert/presentation/pages/bloc/settings_bloc.dart';
import 'package:transfert/presentation/pages/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().initialize();
  runApp(
    BlocProvider(
      create: (context) => getIt<SettingsBloc>()..add(LoadSettingsEvent()),
      child:  MyApp(),
    ),
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
