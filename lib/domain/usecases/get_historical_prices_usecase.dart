import 'package:dartz/dartz.dart';
import '../entities/price_entity.dart';
import '../repositories/price_repository.dart';

// Définition de l'interface générique pour les UseCases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// Classe pour les paramètres (vide dans ce cas car pas besoin de paramètres)
class NoParams {
  const NoParams();
}

// Définition des types d'erreurs possibles
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

// Implémentation du UseCase
class GetHistoricalPricesUseCase implements UseCase<List<PriceEntity>, NoParams> {
  final PriceRepository repository;

  GetHistoricalPricesUseCase(this.repository);

  @override
  Future<Either<Failure, List<PriceEntity>>> call(NoParams params) async {
    try {
      final prices = await repository.getHistoricalPrices();
      return Right(prices);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// Extension pour utiliser facilement le UseCase dans le BLoC
extension GetHistoricalPricesUseCaseExtension on GetHistoricalPricesUseCase {
  Future<Either<Failure, List<PriceEntity>>> execute() async {
    return call(NoParams());
  }
}