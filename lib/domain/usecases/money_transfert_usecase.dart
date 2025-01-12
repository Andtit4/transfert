import 'package:transfert/domain/entities/beneficiary.dart';
import 'package:transfert/domain/entities/card.dart';
import 'package:transfert/domain/repositories/money_transfert_repository.dart';

class MoneyTransferUseCases {
  final MoneyTransferRepository repository;
  
  MoneyTransferUseCases(this.repository);
  
  Future<List<Card>> getCards() => repository.getCards();
  Future<List<Beneficiary>> getBeneficiaries() => repository.getBeneficiaries();
  Future<void> sendMoney(String cardId, String beneficiaryId, double amount) => 
      repository.sendMoney(
        cardId: cardId,
        beneficiaryId: beneficiaryId,
        amount: amount,
      );
  Future<double> getBalance() => repository.getBalance();
}