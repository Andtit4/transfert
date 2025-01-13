import '../../domain/entities/price_entity.dart';

class PriceModel extends PriceEntity {
  PriceModel({
    required DateTime date,
    required double price,
    required double volume,
  }) : super(
          date: date,
          price: price,
          volume: volume,
        );

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      date: DateTime.parse(json['date']),
      price: json['price'].toDouble(),
      volume: json['volume'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'price': price,
      'volume': volume,
    };
  }
}