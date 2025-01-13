import 'package:flutter/material.dart';
import 'package:transfert/presentation/pages/widget/image.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _HeaderSection(),
                SizedBox(height: 20),
                _CardSection(),
                SizedBox(height: 20),
                _ActionButtons(),
                SizedBox(height: 20),
                _TransactionsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange[200],
          ),
          child: const Center(
            child: Text(
              'A',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'Total Balance',
                style: Theme.of(context).textTheme.bodyMedium,
                /* style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ), */
              ),
              Text(
                '\$56,980.00',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _CardSection extends StatelessWidget {
  const _CardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Anik Deb',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '6458 8345 7909 0001',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '10/25',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: ImageCached(
              url: 'https://logo-marque.com/wp-content/uploads/2020/06/Visa-Logo.png',
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(
          icon: Icons.download,
          label: 'Deposit',
          onTap: () {},
        ),
        _buildActionButton(
          icon: Icons.upload,
          label: 'Withdraw',
          onTap: () {},
        ),
        _buildActionButton(
          icon: Icons.swap_horiz,
          label: 'Transfer',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(icon, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
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