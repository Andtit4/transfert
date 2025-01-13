import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:transfert/presentation/cubit/navigation_cubit.dart';
import 'package:transfert/presentation/pages/pages/dashboard/dashboard_page.dart';
import 'package:transfert/presentation/pages/pages/historical_screen.dart';
import 'package:transfert/presentation/pages/pages/history/histoy_page.dart';
import 'package:transfert/presentation/pages/pages/send_money_page.dart';
import 'package:transfert/presentation/pages/pages/transaction_page.dart';
import 'package:transfert/presentation/pages/pages/setting_page.dart';
import 'package:transfert/presentation/pages/widget/custom_bottom_nav.dart';

class MainScreen extends StatelessWidget {
  final List<Widget> _screens = [
    DashboardPage(),
    HistoryPage(),
    // HistoryPage(),
    SendMoneyPage(),
    HistoricalScreen()

    /* const AddTransactionPage(),
    const NotificationsPage(),
    const ProfilePage(), */
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: _screens,
            ),
            bottomNavigationBar: CustomBottomNavBar(
              selectedIndex: currentIndex,
              onItemSelected: (index) {
                // Si c'est le bouton central, on peut avoir une logique différente
                if (index == 2) {
                  // Ouvrir une modale ou naviguer vers une nouvelle page
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SendMoneyPage(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                  );
                } else {
                  context.read<NavigationCubit>().setTab(index);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
