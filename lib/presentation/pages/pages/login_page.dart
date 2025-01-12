import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/core/theme/app_colors.dart';
import 'package:transfert/core/theme/app_theme.dart';
import 'package:transfert/presentation/cubit/navigation_cubit.dart';
import 'package:transfert/presentation/pages/main_screen.dart';
import 'package:transfert/presentation/pages/pages/home_page.dart';
import 'package:transfert/presentation/pages/widget/custom_bottom_nav.dart';
import 'package:transfert/presentation/pages/widget/image.dart';
import 'package:transfert/presentation/pages/widget/input.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Text(
              'ITU',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Hey, Enter your details to get sign in\nto your account',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            /* TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Email / Phone No',
                border: OutlineInputBorder(),
              ),
            ), */
            InputCustom(
              hintText: 'Enter Email / Phone No',
              hintColor: AppColors.inputColor,
            ),
            const SizedBox(height: 16),
            /* TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Passcode',
                border: const OutlineInputBorder(),
                suffixIcon: TextButton(
                  child: const Text('Hide'),
                  onPressed: () {},
                ),
              ),
            ), */
            InputCustom(
              hintText: 'Passcode',
              hintColor: AppColors.inputColor,
              suffix: Text('Hide'),
              obscureText: true,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                child: const Text('Having trouble to sign in?'),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Sign in'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Or Sign in with'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SocialButton(
                  icon:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png',
                  onPressed: () {},
                ),
                _SocialButton(
                  icon:
                      'https://static-00.iconduck.com/assets.00/apple-logo-icon-1661x2048-8adk63j7.png',
                  onPressed: () {},
                ),
                _SocialButton(
                  icon:
                      'https://www.iconpacks.net/icons/1/free-phone-icon-1-thumb.png',
                  onPressed: () {},
                ),
              ],
            ),
            // const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                TextButton(
                  child: const Text('Request Now'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ImageCached(
        width: 32,
        height: 32,
        url: icon,
      ),
    );
  }
}
