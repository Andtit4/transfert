import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/domain/entities/profile_entity.dart';
import 'package:transfert/domain/usecases/get_historical_prices_usecase.dart';
import 'package:transfert/domain/usecases/profile_usecase.dart';
import 'package:transfert/domain/usecases/update_preferenc_usecase.dart';
// Events
abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class UpdatePreferenceEvent extends ProfileEvent {
  final PreferenceType type;
  final bool value;

  UpdatePreferenceEvent({
    required this.type,
    required this.value,
  });
}

class LogoutRequested extends ProfileEvent {}

// States
abstract class ProfileState {
  final bool isLoading;
  
  const ProfileState({this.isLoading = false});
}

class ProfileInitial extends ProfileState {
  ProfileInitial() : super(isLoading: false);
}

class ProfileLoaded extends ProfileState {
  final ProfileEntity profile;
  
  ProfileLoaded({
    required this.profile,
    bool isLoading = false,
  }) : super(isLoading: isLoading);
}

class ProfileError extends ProfileState {
  final String message;
  final ProfileEntity? profile;  // Garder le profil en cas d'erreur de mise à jour

  ProfileError({
    required this.message,
    this.profile,
    bool isLoading = false,
  }) : super(isLoading: isLoading);
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfile;
  final UpdatePreferenceUseCase updatePreference;

  ProfileBloc({
    required this.getProfile,
    required this.updatePreference,
  }) : super(ProfileInitial()) {
    
    // Gestionnaire pour charger le profil
    on<LoadProfile>((event, emit) async {
      // Si on a déjà un profil, on le garde pendant le chargement
      if (state is ProfileLoaded) {
        emit(ProfileLoaded(
          profile: (state as ProfileLoaded).profile,
          isLoading: true,
        ));
      } else {
        emit(ProfileInitial());
      }

      final result = await getProfile(NoParams1());
      
      result.fold(
        (failure) => emit(ProfileError(message: failure.message)),
        (profile) => emit(ProfileLoaded(profile: profile)),
      );
    });

    // Gestionnaire pour mettre à jour les préférences
    on<UpdatePreferenceEvent>((event, emit) async {
      if (state is ProfileLoaded) {
        final currentProfile = (state as ProfileLoaded).profile;
        
        // Émettre l'état de chargement tout en gardant le profil actuel
        emit(ProfileLoaded(
          profile: currentProfile,
          isLoading: true,
        ));

        final result = await updatePreference(
          UpdatePreferenceParams1(
            preference: PreferenceVO(
              type: event.type,
              value: event.value,
            ),
          ),
        );

        result.fold(
          (failure) => emit(ProfileError(
            message: failure.message,
            profile: currentProfile,  // Garder le profil en cas d'erreur
          )),
          (success) {
            if (success) {
              add(LoadProfile()); // Recharger le profil après une mise à jour réussie
            } else {
              emit(ProfileError(
                message: 'Failed to update preference',
                profile: currentProfile,
              ));
            }
          },
        );
      }
    });
  }

  // Méthodes utilitaires pour faciliter l'utilisation
  void updatePushNotifications(bool enabled) {
    add(UpdatePreferenceEvent(
      type: PreferenceType.pushNotification,
      value: enabled,
    ));
  }

  void updateFaceId(bool enabled) {
    add(UpdatePreferenceEvent(
      type: PreferenceType.faceId,
      value: enabled,
    ));
  }
}