import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/validators/id_validator.dart';
import 'package:store_client/src/failures/trace_failures.dart';

@Injectable()
class GetAllTopicsBySectionIDUseCase extends UseCase<List<Topic>, int> {
  @override
  FutureOr<Either<Failure, List<Topic>>> call(int sectionId) async {
    final LibraryRepository libraryRepository = services.get<LibraryRepository>();

    if (!(await IdValidator().validate(sectionId))) {
      return Left(IncorrectSectionIdFailure(StackTrace.empty));
    }

    return libraryRepository.getAllTopicsBySectionID(id: sectionId);
  }
}
