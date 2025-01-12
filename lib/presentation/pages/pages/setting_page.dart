import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfert/domain/repositories/settings_repository.dart';
import 'package:transfert/domain/repositories/settings_repository_impl.dart';
import 'package:transfert/domain/usecases/settings_usecase.dart';
import 'package:transfert/presentation/pages/bloc/settings_bloc.dart';

class SettingsPageWrapper extends StatelessWidget {
  const SettingsPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        // Vous devrez injecter vos usecases ici
        SettingsUseCases(
            // Ici, vous devriez injecter une instance concrète de votre repository
            // Par exemple, si vous avez une classe SettingsRepositoryImpl qui implémente SettingsRepository,
            // vous devriez l'injecter ici comme ceci :
            SettingsRepositoryImpl(
                SharedPreferences.getInstance() as SharedPreferences)),
      )..add(LoadSettingsEvent()), // Charger les paramètres immédiatement
      child: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Params'),
        automaticallyImplyLeading: false, // Cela enlève le bouton retour
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.headphones),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            title: const Text('Google Authenticator'),
            trailing: Switch(
              // value: state.settings.isGoogleAuthEnabled,
              value: true,
              onChanged: (value) {
                context.read<SettingsBloc>().add(
                      ToggleGoogleAuthEvent(value),
                    );
              },
            ),
          ),
          ListTile(
            title: const Text('Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to password change screen
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Parameter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            title: const Text('Choose language'),
            trailing: ElevatedButton(
              child: const Text('Anglais'),
              onPressed: () {
                context.read<SettingsBloc>().add(
                      ChangeLanguageEvent('en'),
                    );
              },
            ),
          ),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to about screen
            },
          ),
        ],
      ),

      /*  BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SettingsLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Mon compte',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  ListTile(
                    title: const Text('Google Authenticator'),
                    trailing: Switch(
                      value: state.settings.isGoogleAuthEnabled,
                      onChanged: (value) {
                        context.read<SettingsBloc>().add(
                              ToggleGoogleAuthEvent(value),
                            );
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Mot de passe'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigate to password change screen
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Paramétrage',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  ListTile(
                    title: const Text('Changer de langue pour'),
                    trailing: ElevatedButton(
                      child: const Text('Anglais'),
                      onPressed: () {
                        context.read<SettingsBloc>().add(
                              ChangeLanguageEvent('en'),
                            );
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('A propos de nous'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigate to about screen
                    },
                  ),
                ],
              ),
            );
          }
          if (state is SettingsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ), */
    );
  }
}
