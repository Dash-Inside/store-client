import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/validators/id_validator.dart';
import 'package:store_client/src/failures/trace_failures.dart';

@Injectable()
class RemoveFavoriteTopicUseCase extends UseCase<Unit, int> {
  @override
  FutureOr<Either<Failure, Unit>> call(int favoriteId) async {
    final LibraryRepository libraryRepository = services.get<LibraryRepository>();

    if (!(await IdValidator().validate(favoriteId))) {
      return Left(IncorrectFavoriteIdFailure(StackTrace.empty));
    }

    return libraryRepository.removeFavoriteTopic(id: favoriteId);
  }
}
