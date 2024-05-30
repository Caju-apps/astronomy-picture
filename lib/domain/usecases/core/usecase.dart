import 'package:astronomy_picture/core/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<R, P> {
  /// Default useCase
  /// R is the return of function call
  /// P is the parameter of function call
  Future<Either<Failure, R>> call(P parameter);
}

class NoParameter {}