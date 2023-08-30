import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/validators/search_topic_validator.dart';
import 'package:store_client/src/failures/trace_failures.dart';

@Injectable()
class SearchTopicByTitleUseCase extends UseCase<List<Topic>, String> {
  final LibraryRepository libraryRepository = services.get<LibraryRepository>();

  @override
  FutureOr<Either<Failure, List<Topic>>> call(String title) async {
    final LibraryRepository libraryRepository = services.get<LibraryRepository>();
    if (!(await SearchTopicValidator().validate(title))) {
      return Left(IncorrectTopicTitleFailure(StackTrace.empty));
    }

    return libraryRepository.searchTopicByTitle(title: title);
  }
}
