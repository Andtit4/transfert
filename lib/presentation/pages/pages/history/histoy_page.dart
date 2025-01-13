import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _TransactionsSection(),
            ],
          ),
        ),
      )),
    );
  }
}

class _TransactionsSection extends StatelessWidget {
  const _TransactionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        _TransactionTile(
          avatar: 'JW',
          name: 'Jenny Wilson',
          date: 'Today, 12:30 pm',
          amount: -438,
          backgroundColor: Colors.red[50]!,
        ),
        _TransactionTile(
          avatar: 'WW',
          name: 'Wade Warren',
          date: 'Today, 11:45 am',
          amount: 5200,
          backgroundColor: Colors.purple[50]!,
        ),
        _TransactionTile(
          avatar: 'CW',
          name: 'Cameron Williamson',
          date: 'Today, 11:30 am',
          amount: 8788,
          backgroundColor: Colors.blue[50]!,
        ),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final String avatar;
  final String name;
  final String date;
  final double amount;
  final Color backgroundColor;

  const _TransactionTile({
    Key? key,
    required this.avatar,
    required this.name,
    required this.date,
    required this.amount,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                avatar,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount > 0 ? '+\$${amount.abs()}' : '-\$${amount.abs()}',
            style: TextStyle(
              color: amount > 0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
