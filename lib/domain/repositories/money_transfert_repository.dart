import 'package:transfert/domain/entities/beneficiary.dart';
import 'package:transfert/domain/entities/card.dart';

abstract class MoneyTransferRepository {
  Future<List<Card>> getCards();
  Future<List<Beneficiary>> getBeneficiaries();
  Future<void> sendMoney({
    required String cardId,
    required String beneficiaryId,
    required double amount,
  });
  Future<double> getBalance();
}