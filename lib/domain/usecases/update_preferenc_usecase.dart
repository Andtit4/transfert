
import 'package:dartz/dartz.dart';
import 'package:transfert/domain/repositories/profile_repository.dart';

// Base UseCase
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// Types de préférences
enum PreferenceType {
  pushNotification,
  faceId,
  pinCode,
}

// Value Object pour les préférences
class PreferenceVO {
  final PreferenceType type;
  final bool value;

  PreferenceVO({
    required this.type,
    required this.value,
  });

  String get key {
    switch (type) {
      case PreferenceType.pushNotification:
        return 'push_notifications';
      case PreferenceType.faceId:
        return 'face_id';
      case PreferenceType.pinCode:
        return 'pin_code';
    }
  }
}

// Paramètres du UseCase
class UpdatePreferenceParams1 {
  final PreferenceVO preference;

  UpdatePreferenceParams1({required this.preference});
}

// Définition des erreurs
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class PreferenceUpdateFailure extends Failure {
  final String code;
  
  const PreferenceUpdateFailure({
    required String message,
    required this.code,
  }) : super(message);
}

// Interface du UseCase
abstract class UpdatePreferenceUseCase implements UseCase<bool, UpdatePreferenceParams1> {
  @override
  Future<Either<Failure, bool>> call(UpdatePreferenceParams1 params);
}

// Implémentation du UseCase
class UpdatePreferenceUseCaseImpl implements UpdatePreferenceUseCase {
  final ProfileRepository repository;

  UpdatePreferenceUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdatePreferenceParams1 params) async {
    try {
      // Validation des paramètres
      if (!_validatePreference(params.preference)) {
        return Left(PreferenceUpdateFailure(
          message: 'Invalid preference value',
          code: 'INVALID_PREFERENCE',
        ));
      }

      // Vérification spécifique pour Face ID
      if (params.preference.type == PreferenceType.faceId) {
        final isFaceIdAvailable = await _checkFaceIdAvailability();
        if (!isFaceIdAvailable) {
          return Left(PreferenceUpdateFailure(
            message: 'Face ID is not available on this device',
            code: 'FACE_ID_NOT_AVAILABLE',
          ));
        }
      }

      // Mise à jour de la préférence
      final success = await repository.updatePreference(
        params.preference.key,
        params.preference.value,
      );

      if (!success) {
        return Left(PreferenceUpdateFailure(
          message: 'Failed to update preference',
          code: 'UPDATE_FAILED',
        ));
      }

      // Notification du changement si nécessaire
      if (params.preference.type == PreferenceType.pushNotification) {
        await _handlePushNotificationChange(params.preference.value);
      }

      return Right(success);
    } on Exception catch (e) {
      return Left(PreferenceUpdateFailure(
        message: e.toString(),
        code: 'UNEXPECTED_ERROR',
      ));
    }
  }

  bool _validatePreference(PreferenceVO preference) {
    switch (preference.type) {
      case PreferenceType.pushNotification:
        return true;
      case PreferenceType.faceId:
        return true;
      case PreferenceType.pinCode:
        return true;
    }
  }

  Future<bool> _checkFaceIdAvailability() async {
    try {
      await Future.delayed(Duration(milliseconds: 100));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _handlePushNotificationChange(bool enabled) async {
    if (enabled) {
      await _requestNotificationPermission();
    } else {
      await _cleanupNotificationTokens();
    }
  }

  Future<void> _requestNotificationPermission() async {
    await Future.delayed(Duration(milliseconds: 100));
  }

  Future<void> _cleanupNotificationTokens() async {
    await Future.delayed(Duration(milliseconds: 100));
  }
}

// Extension pour faciliter l'utilisation
extension UpdatePreferenceUseCaseExtension on UpdatePreferenceUseCaseImpl {
  Future<Either<Failure, bool>> updatePushNotifications(bool enabled) {
    return call(UpdatePreferenceParams1(
      preference: PreferenceVO(
        type: PreferenceType.pushNotification,
        value: enabled,
      ),
    ));
  }

  Future<Either<Failure, bool>> updateFaceId(bool enabled) {
    return call(UpdatePreferenceParams1(
      preference: PreferenceVO(
        type: PreferenceType.faceId,
        value: enabled,
      ),
    ));
  }
}