import 'package:flutter/material.dart';
import 'package:transfert/domain/entities/beneficiary.dart';

class BeneficiaryAvatar extends StatelessWidget {
  final Beneficiary beneficiary;
  
  const BeneficiaryAvatar({
    Key? key,
    required this.beneficiary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(beneficiary.imageUrl),
          radius: 30,
        ),
        SizedBox(height: 4),
        Text(
          beneficiary.name,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}