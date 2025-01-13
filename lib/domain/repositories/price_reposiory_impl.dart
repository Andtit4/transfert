import 'package:flutter/material.dart';
import 'package:transfert/data/datasources/price_data_source.dart';
import 'package:transfert/domain/entities/price_entity.dart';
import 'package:transfert/domain/repositories/price_repository.dart';

class PriceReposioryImpl implements PriceRepository {
  final PriceDataSource dataSource;

  PriceReposioryImpl(this.dataSource);

  @override
  Future<List<PriceEntity>> getHistoricalPrices() async {
    return await dataSource.getHistoricalPrices();
  }
}
