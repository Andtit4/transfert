import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/presentation/cubit/navigation_cubit.dart';
import 'package:transfert/presentation/pages/pages/home_page.dart';
import 'package:transfert/presentation/pages/widget/custom_bottom_nav.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationTab>(
        builder: (context, tab) {
          return Scaffold(
            body: IndexedStack(
              index: tab.index,
              children: [
                HomePage(),
                /* const SettingsPage(),
                const HistoryPage(),
                const ProfilePage(), */
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentTab: tab,
              onTabSelected: (tab) =>
                  context.read<NavigationCubit>().setTab(tab),
            ),
          );
        },
      ),
    );
  }
}