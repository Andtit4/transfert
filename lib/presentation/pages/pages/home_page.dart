import 'package:flutter/material.dart';
import 'package:transfert/core/theme/app_colors.dart';
import 'package:transfert/presentation/pages/widget/custom_bottom_nav.dart';
import 'package:transfert/presentation/pages/widget/input.dart';
import 'package:transfert/presentation/pages/widget/phone_input.dart';
import 'package:transfert/presentation/pages/widget/verify_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Send Money \nall over the world',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              _buildPillButton('My Informations', Color.fromARGB(80, 255, 240, 240)),
              const SizedBox(height: 8),
              verificationCard(),
              const SizedBox(height: 16),
              _buildTransactionCard(
                title: 'Send to',
                color: const Color(0xFF008080), // Teal
                borderColor: const Color(0xFFE5F9F9),
                showAddressField: true,
              ),
              const SizedBox(height: 24),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavBar(currentTab: 1, onTabSelected: (NavigationTab ) {  },),
    );
  }

  Widget _buildTransactionCard({
    required String title,
    required Color color,
    required Color borderColor,
    bool showAddressField = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const SizedBox(height: 8),
          /* Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildDropdownButton(),
              ),
              const SizedBox(width: 12),
              const Expanded(
                flex: 5,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Montant',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ), */
          // const SizedBox(height: 8),
          // _buildMinMaxRow(),
          if (showAddressField) ...[
            // const SizedBox(height: 16),
            const Text(
              'Recepient Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputCustom(
                  hintText: 'FirstName',
                  // hintColor: AppColors.inputColor,
                  width: 130,
                ),
                InputCustom(
                    hintText: 'FirstName',
                    // hintColor: AppColors.inputColor,
                    width: 130),
              ],
            ),
            const SizedBox(height: 16),
            CustomPhoneInput(
              onPhoneValidated: (String app) {},
              // hintColor: AppColors.inputColor,
            ),
            const SizedBox(height: 16),
            InputCustom(
              hintText: 'Location adress',
              // hintColor: AppColors.inputColor,
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Description',
                // border: OutlineInputBorder(),
                // fillColor: AppColors.inputColor,
                filled: true,
                border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),

              ),
            ),
            /* TextField(
              
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on_outlined),
                filled: true,
                fillColor: const Color(0xFFF0F9F9) ,
                hintText: 'Entrer votre adresse',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ), */
          ],
        ],
      ),
    );
  }

  Widget _buildPillButton(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFDC5C5C),
          // fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /*  Widget _buildDropdownButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: 'Choisir',
          items: const [
            DropdownMenuItem(
              value: 'Choisir',
              child: Text('Choisir'),
            ),
          ],
          onChanged: (value) {},
          isExpanded: true,
        ),
      ),
    );
  } */

  Widget _buildMinMaxRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F8),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Min: ', style: TextStyle(color: Color(0xFF4A6FA5))),
                Text('0', style: TextStyle(color: Color(0xFF4A6FA5))),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0F0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Max: ', style: TextStyle(color: Color(0xFFDC5C5C))),
                Text('0', style: TextStyle(color: Color(0xFFDC5C5C))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF008080),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }
}
