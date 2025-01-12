import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/domain/entities/transaction.dart';

class DashboardState {
  final double balance;
  final List<Transaction> transactions;
  final bool isLoading;
  final String? error;

  DashboardState({
    required this.balance,
    required this.transactions,
    this.isLoading = false,
    this.error,
  });
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(
    DashboardState(
      balance: 56980.00,
      transactions: [],
      isLoading: true,
    )
  );

  Future<void> loadDashboard() async {
    try {
      emit(DashboardState(
        balance: state.balance,
        transactions: state.transactions,
        isLoading: true,
      ));

      // Simuler un appel API
      await Future.delayed(const Duration(seconds: 1));

      final transactions = [
        Transaction(
          id: '1',
          name: 'Jenny Wilson',
          avatar: 'JW',
          date: DateTime.now().subtract(const Duration(minutes: 30)),
          amount: -438,
        ),
        // Ajouter d'autres transactions...
      ];

      emit(DashboardState(
        balance: 56980.00,
        transactions: transactions,
        isLoading: false,
      ));
    } catch (e) {
      emit(DashboardState(
        balance: state.balance,
        transactions: state.transactions,
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}