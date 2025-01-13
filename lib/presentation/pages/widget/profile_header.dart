import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final String email;
  final String? avatarUrl;

  const ProfileHeader({
    required this.username,
    required this.email,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: avatarUrl != null
            ? NetworkImage(avatarUrl!)
            : null,
          child: avatarUrl == null
            ? Icon(Icons.person, size: 40)
            : null,
        ),
        SizedBox(height: 16),
        Text(
          username,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 4),
        Text(
          email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Ajout d'un border radius
                ),
              ),
              child: const Text('Edit Profil'),
              onPressed: () {
                /* Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MainScreen())); */
              },
            ),
      ],
    );
  }
}