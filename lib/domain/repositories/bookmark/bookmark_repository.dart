import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/core/success.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';

abstract class BookmarkApodRepository {
  /// Return a SuccessReturn on Right side of Either case is a success, otherwise
  /// Return a Failure on Left side of Either
  Future<Either<Failure, ApodSaved>> saveApod(Apod apod);

  /// Return a SuccessReturn on Right side of Either case is a success, otherwise
  /// Return a Failure on Left side of Either
  Future<Either<Failure, ApodRemoved>> removeSaveApod(String apodDate);

  /// Return a true on Right side of Either case the APOD is save or
  /// false case is no save, otherwise
  /// Return a Failure on Left side of Either
  Future<Either<Failure, bool>> apodIsSave(String apodDate);

  /// Return an Apod List on Right side of Either case is a success, otherwise
  /// Return a Failure on Left side of Either
  Future<Either<Failure, List<Apod>>> fetchAllApodsSaved();
}