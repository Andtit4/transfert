import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/domain/entities/price_entity.dart';
import 'package:transfert/domain/usecases/get_historical_prices_usecase.dart';

// Events
abstract class HistoricalPriceEvent {}

class FetchHistoricalPrices extends HistoricalPriceEvent {}

// States
abstract class HistoricalPriceState {}

class HistoricalPriceInitial extends HistoricalPriceState {}

class HistoricalPriceLoading extends HistoricalPriceState {}

class HistoricalPriceLoaded extends HistoricalPriceState {
  final List<PriceEntity> prices;
  HistoricalPriceLoaded(this.prices);
}

class HistoricalPriceError extends HistoricalPriceState {
  final String message;
  HistoricalPriceError(this.message);
}

// BLoC
class HistoricalPriceBloc extends Bloc<HistoricalPriceEvent, HistoricalPriceState> {
  final GetHistoricalPricesUseCase getHistoricalPrices;

  HistoricalPriceBloc(this.getHistoricalPrices) : super(HistoricalPriceInitial()) {
    on<FetchHistoricalPrices>((event, emit) async {
      emit(HistoricalPriceLoading());
      
      final result = await getHistoricalPrices.execute();
      
      result.fold(
        (failure) => emit(HistoricalPriceError(failure.message)),
        (prices) => emit(HistoricalPriceLoaded(prices))
      );
    });
  }
}