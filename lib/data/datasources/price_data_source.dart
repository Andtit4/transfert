import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transfert/data/models/price_model.dart';

abstract class PriceDataSource {
  Future<List<PriceModel>> getHistoricalPrices();
}

class PriceDataSourceImpl implements PriceDataSource {
  @override
  Future<List<PriceModel>> getHistoricalPrices() async {
    return Future.delayed(
        const Duration(seconds: 1),
        () => List.generate(
            30,
            (index) => PriceModel(
                date: DateTime.now().subtract(Duration(days: index)),
                price: 9700 + (index * Random().nextDouble() * 1000),
                volume: 1000000 + Random().nextDouble() * 1000000)));
  }
}
