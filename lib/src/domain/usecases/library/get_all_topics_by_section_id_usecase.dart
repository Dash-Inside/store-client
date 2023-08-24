import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

@Injectable()
class GetAllTopicsBySectionIDUseCase extends UseCase<List<Topic>, int> {
  @override
  FutureOr<Either<Failure, List<Topic>>> call(int id) {
    final LibraryRepository libraryRepository = services.get<LibraryRepository>();

    return libraryRepository.getAllTopicsBySectionID(
      id: id,
    );
  }
}
