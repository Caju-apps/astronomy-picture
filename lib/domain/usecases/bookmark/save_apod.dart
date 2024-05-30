import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/core/success.dart';
import 'package:astronomy_picture/domain/repositories/bookmark/bookmark_repository.dart';
import 'package:astronomy_picture/domain/usecases/core/usecase.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';

class SaveApod extends UseCase<ApodSaved, Apod> {
  final BookmarkApodRepository repository;

  SaveApod({required this.repository});

  @override
  Future<Either<Failure, ApodSaved>> call(Apod parameter) async {
    return await repository.saveApod(parameter);
  }
}
