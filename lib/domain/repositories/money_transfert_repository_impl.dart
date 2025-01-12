import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfert/domain/entities/beneficiary.dart';
import 'package:transfert/domain/entities/card.dart';
import 'package:transfert/domain/entities/settings.dart';
import 'package:transfert/domain/repositories/money_transfert_repository.dart';

class MoneyTransfertRepositoryImpl implements MoneyTransferRepository {
  MoneyTransfertRepositoryImpl();

  @override
  Future<double> getBalance() async {
    // Exemple d'implémentation pour récupérer le solde
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('balance') ?? 0.0;
  }

  @override
  Future<List<Beneficiary>> getBeneficiaries() async {
    // Exemple d'implémentation pour récupérer les bénéficiaires
    // Remplacez par votre logique de récupération des données
    return [
      Beneficiary(id: '1', name: 'John Doe', imageUrl: ''),
      Beneficiary(id: '2', name: 'Jane Smith',  imageUrl: ''),
    ];
  }

  @override
  Future<List<Card>> getCards() async {
    // Exemple d'implémentation pour récupérer les cartes
    // Remplacez par votre logique de récupération des données
    return [
      Card(type:'Visa' , number: '1234 5678 9012 3456'),
      Card(type: '2', number: '6543 2109 8765 4321',),
    ];
  }

  @override
  Future<void> sendMoney(
      {required String cardId,
      required String beneficiaryId,
      required double amount}) async {
    // Exemple d'implémentation pour envoyer de l'argent
    // Ajoutez votre logique d'envoi d'argent ici
    print(
        'Envoi de $amount de la carte $cardId au bénéficiaire $beneficiaryId');
  }
}
