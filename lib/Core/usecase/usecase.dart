import 'package:fpdart/fpdart.dart';
import '../../../../Core/error/failures.dart';

abstract class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}