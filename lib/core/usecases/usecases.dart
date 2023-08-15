//ignore_for_file: prefer-match-file-name

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';

abstract class UseCase<ReturnType, Params> {
  FutureOr<Either<Failure, ReturnType>> call(Params params);
}
