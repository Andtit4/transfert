import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/domain/entities/beneficiary.dart';
import 'package:transfert/domain/entities/card.dart';
import 'package:transfert/domain/usecases/money_transfert_usecase.dart';

// Events
abstract class MoneyTransferEvent {}

class LoadDataEvent extends MoneyTransferEvent {}

class UpdateAmountEvent extends MoneyTransferEvent {
  final String digit;
  UpdateAmountEvent(this.digit);
}

class DeleteDigitEvent extends MoneyTransferEvent {}

class SendMoneyEvent extends MoneyTransferEvent {
  final String beneficiaryId;
  SendMoneyEvent(this.beneficiaryId);
}

// States
abstract class MoneyTransferState {}

class MoneyTransferInitial extends MoneyTransferState {}

class MoneyTransferLoading extends MoneyTransferState {


}

class MoneyTransferLoaded extends MoneyTransferState {
  final List<Card> cards;
  final List<Beneficiary> beneficiaries;
  final double balance;
  final String amount;
  
  MoneyTransferLoaded({
    required this.cards,
    required this.beneficiaries,
    required this.balance,
    required this.amount,
  });
  
  double get amountValue => double.tryParse(amount) ?? 0.0;
  
  MoneyTransferLoaded copyWith({
    List<Card>? cards,
    List<Beneficiary>? beneficiaries,
    double? balance,
    String? amount,
  }) {
    return MoneyTransferLoaded(
      cards: cards ?? this.cards,
      beneficiaries: beneficiaries ?? this.beneficiaries,
      balance: balance ?? this.balance,
      amount: amount ?? this.amount,
    );
  }
}

class MoneyTransferError extends MoneyTransferState {
  final String message;
  MoneyTransferError(this.message);
}

class MoneyTransferBloc extends Bloc<MoneyTransferEvent, MoneyTransferState> {
  final MoneyTransferUseCases useCases;
  
  MoneyTransferBloc(this.useCases) : super(MoneyTransferInitial()) {
    on<LoadDataEvent>(_onLoadData);
    on<UpdateAmountEvent>(_onUpdateAmount);
    on<DeleteDigitEvent>(_onDeleteDigit);
    on<SendMoneyEvent>(_onSendMoney);
  }
  
  Future<void> _onLoadData(LoadDataEvent event, Emitter<MoneyTransferState> emit) async {
    emit(MoneyTransferLoading());
    try {
      final cards = await useCases.getCards();
      final beneficiaries = await useCases.getBeneficiaries();
      final balance = await useCases.getBalance();
      
      emit(MoneyTransferLoaded(
        cards: cards,
        beneficiaries: beneficiaries,
        balance: balance,
        amount: "0",
      ));
    } catch (e) {
      emit(MoneyTransferError(e.toString()));
    }
  }
  
  void _onUpdateAmount(UpdateAmountEvent event, Emitter<MoneyTransferState> emit) {
    if (state is MoneyTransferLoaded) {
      final currentState = state as MoneyTransferLoaded;
      String newAmount = currentState.amount;
      
      if (currentState.amount == "0") {
        newAmount = event.digit;
      } else {
        newAmount = currentState.amount + event.digit;
      }
      
      if (double.parse(newAmount) <= currentState.balance) {
        emit(currentState.copyWith(amount: newAmount));
      }
    }
  }
  
  void _onDeleteDigit(DeleteDigitEvent event, Emitter<MoneyTransferState> emit) {
    if (state is MoneyTransferLoaded) {
      final currentState = state as MoneyTransferLoaded;
      String newAmount = currentState.amount;
      
      if (newAmount.length > 1) {
        newAmount = newAmount.substring(0, newAmount.length - 1);
      } else {
        newAmount = "0";
      }
      
      emit(currentState.copyWith(amount: newAmount));
    }
  }
  
  Future<void> _onSendMoney(SendMoneyEvent event, Emitter<MoneyTransferState> emit) async {
    if (state is MoneyTransferLoaded) {
      final currentState = state as MoneyTransferLoaded;
      try {
        await useCases.sendMoney(
          currentState.cards.first.number,
          event.beneficiaryId,
          currentState.amountValue,
        );
        add(LoadDataEvent()); // Recharger les données après l'envoi
      } catch (e) {
        emit(MoneyTransferError(e.toString()));
      }
    }
  }
}