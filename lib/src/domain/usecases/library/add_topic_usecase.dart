import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/actions/add_topic_action_params.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/validators/add_topic_validator.dart';
import 'package:store_client/src/failures/trace_failures.dart';

@Injectable()
class AddTopicUseCase extends UseCase<Unit, AddTopicActionParams> {
  @override
  FutureOr<Either<Failure, Unit>> call(AddTopicActionParams addTopicActionParams) async {
    final LibraryRepository libraryRepository = services.get<LibraryRepository>();
    if (!(await AddTopicValidator().validate(addTopicActionParams))) {
      return Left(IncorrectTopicParamsFailure(StackTrace.empty));
    }

    return libraryRepository.addTopic(addTopicActionParams: addTopicActionParams);
  }
}
