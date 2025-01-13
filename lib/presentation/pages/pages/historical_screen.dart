import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/presentation/pages/widget/price_chart.dart';
import '../bloc/historical_price_bloc.dart';

class HistoricalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: BlocBuilder<HistoricalPriceBloc, HistoricalPriceState>(
          builder: (context, state) {
            if (state is HistoricalPriceLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HistoricalPriceLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '\$${state.prices.first.price.toStringAsFixed(2)} - amount',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Expanded(
                    child: PriceChart(prices: state.prices),
                  ),
                 /*  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Implement buy action
                          },
                          child: Text('BUY'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Implement sell action
                          },
                          child: Text('SELL'),
                        ),
                      ],
                    ),
                  ), */
                ],
              );
            } else if (state is HistoricalPriceError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}