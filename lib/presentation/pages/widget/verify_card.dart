import 'package:flutter/material.dart';
import 'package:transfert/core/theme/app_colors.dart';
import 'package:transfert/presentation/pages/main_screen.dart';

class verificationCard extends StatefulWidget {
  const verificationCard({super.key});

  @override
  State<verificationCard> createState() => _verificationCardState();
}

class _verificationCardState extends State<verificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Icon(Icons.person, size: 50, color: Colors.grey,),
          const SizedBox(height: 8),
          Text('Identity not verified'),
          const SizedBox(height: 8),
          // _buildMinMaxRow(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Verify now'),
              onPressed: (){},
              /* onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainScreen()));
              }, */
            ),
        ],
      ),
    );
  }
}