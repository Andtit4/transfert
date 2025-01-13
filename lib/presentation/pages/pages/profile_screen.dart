import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/domain/usecases/update_preferenc_usecase.dart';
import 'package:transfert/presentation/pages/widget/profile_header.dart';
import 'package:transfert/presentation/pages/widget/settings_section.dart';
import '../bloc/profile_bloc.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        
        if (state is ProfileLoaded) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  ProfileHeader(
                    username: state.profile.username,
                    email: state.profile.email,
                    avatarUrl: state.profile.avatarUrl,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Investments',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SettingsSection(
                    items: [
                      SettingsItem(
                        icon: Icons.folder_outlined,
                        title: 'My stories',
                        trailing: Icon(Icons.chevron_right),
                      ),
                      SettingsItem(
                        icon: Icons.help_outline,
                        title: 'Support',
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Preferences',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SettingsSection(
                    items: [
                      SettingsItem(
                        icon: Icons.notifications_outlined,
                        title: 'Push notifications',
                        trailing: Switch(
                          value: state.profile.isPushEnabled,
                          onChanged: (value) {
                            context.read<ProfileBloc>().add(
                              UpdatePreferenceEvent(
                                type: PreferenceType.pushNotification,
                                value: value,
                              ),
                            );
                          },
                        ),
                      ),
                      SettingsItem(
                        icon: Icons.face_outlined,
                        title: 'Face ID',
                        trailing: Switch(
                          value: state.profile.isFaceIdEnabled,
                          onChanged: (value) {
                            context.read<ProfileBloc>().add(
                              UpdatePreferenceEvent(
                                type: PreferenceType.faceId,
                                value: value,
                              ),
                            );
                          },
                        ),
                      ),
                      SettingsItem(
                        icon: Icons.lock_outline,
                        title: 'PIN Code',
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Implement logout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[50],
                      foregroundColor: Colors.red,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
          );
        }
        
        if (state is ProfileError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }
        
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}