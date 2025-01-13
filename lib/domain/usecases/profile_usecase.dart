import 'package:dartz/dartz.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

// GetProfile UseCase
class GetProfileUseCase implements UseCase<ProfileEntity, NoParams1> {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams1 params) async {
    try {
      final profile = await repository.getProfile();
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// UpdatePreference UseCase
class UpdatePreferenceParams {
  final String preferenceKey;
  final bool value;

  UpdatePreferenceParams({
    required this.preferenceKey,
    required this.value,
  });
}

class UpdatePreferenceUseCase1 implements UseCase<bool, UpdatePreferenceParams> {
  final ProfileRepository repository;

  UpdatePreferenceUseCase1(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdatePreferenceParams params) async {
    try {
      final success = await repository.updatePreference(
        params.preferenceKey,
        params.value,
      );
      return Right(success);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class NoParams1 {
  const NoParams1();
}