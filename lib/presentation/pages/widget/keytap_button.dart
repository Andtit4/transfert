import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/presentation/pages/bloc/money_transfert_bloc.dart';

class KeypadButton extends StatelessWidget {
  final String digit;
  
  const KeypadButton({
    Key? key,
    required this.digit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<MoneyTransferBloc>().add(UpdateAmountEvent(digit));
      },
      child: Text(
        digit,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<MoneyTransferBloc>().add(DeleteDigitEvent());
      },
      child: Icon(Icons.backspace_outlined),
    );
  }
}