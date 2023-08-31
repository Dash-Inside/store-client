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
class AddFavoriteTopicUseCase extends UseCase<Unit, int> {
  @override
  FutureOr<Either<Failure, Unit>> call(int topicId) async {
    final LibraryRepository libraryRepository = services.get<LibraryRepository>();

    if (!(await IdValidator().validate(topicId))) {
      return Left(IncorrectTopicIdFailure(StackTrace.empty));
    }

    return libraryRepository.addFavoriteTopic(id: topicId);
  }
}
