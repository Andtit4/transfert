import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/presentation/pages/bloc/money_transfert_bloc.dart';
import 'package:transfert/presentation/pages/widget/benificiary_avatar.dart';
import 'package:transfert/presentation/pages/widget/image.dart';
import 'package:transfert/presentation/pages/widget/keytap_button.dart';

class SendMoneyPage extends StatelessWidget {
  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTransferBloc, MoneyTransferState>(
      builder: (context, state) {
        if (state is MoneyTransferLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MoneyTransferLoaded) {
          // print('loade');
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Card Section
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'V',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            state.cards.first.number,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(height: 8,),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 0, left: 16, right: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 26, 24, 167),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ImageCached(
                              width: 40,
                              height: 40,
                              url:
                                  'https://www.paypalobjects.com/marketing/web23/us/en/ppe/mobile-apps/card-wrapped-content-section-01_size-all.png'),
                          SizedBox(width: 8),
                          Text(
                            'PayPal',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 0, left: 16, right: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 248, 248),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ImageCached(
                              width: 40,
                              height: 40,
                              url:
                                  'https://raw.githubusercontent.com/stripe/stripe-android/master/assets/stripe_logo_slate_small.png'),
                          SizedBox(width: 8),
                          Text('Stripe',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ],
                      ),
                    ),
                    // Beneficiaries Section
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beneficiary',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          // SizedBox(height: 16),
                          /* SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.beneficiaries.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  // return AddNewBeneficiaryButton();
                                }
                                final beneficiary =
                                    state.beneficiaries[index - 1];
                                return BeneficiaryAvatar(
                                    beneficiary: beneficiary);
                              },
                            ),
                          ), */
                        ],
                      ),
                    ),

                    // Amount Section
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$${state.amount}.00',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          'Your balance: \$${state.balance.toStringAsFixed(2)} (available)',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),

                    // Keypad
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              KeypadButton(digit: '1'),
                              KeypadButton(digit: '2'),
                              KeypadButton(digit: '3'),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              KeypadButton(digit: '4'),
                              KeypadButton(digit: '5'),
                              KeypadButton(digit: '6'),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              KeypadButton(digit: '7'),
                              KeypadButton(digit: '8'),
                              KeypadButton(digit: '9'),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              KeypadButton(digit: '.'),
                              KeypadButton(digit: '0'),
                              DeleteButton(),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Send Button
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: state.amountValue > 0
                            ? () {
                                // TODO: Implement send logic
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Send \$${state.amount}.00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        print('Unexpected state: $state');
        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
