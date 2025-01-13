import '../entities/price_entity.dart';

abstract class PriceRepository {
  Future<List<PriceEntity>> getHistoricalPrices();
}