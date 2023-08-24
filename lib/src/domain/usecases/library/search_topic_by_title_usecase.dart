import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

@Injectable()
class SearchTopicByTitleUseCase extends UseCase<Topic, String> {
  final LibraryRepository libraryRepository = services.get<LibraryRepository>();

  @override
  FutureOr<Either<Failure, Topic>> call(String title) {
    final LibraryRepository libraryRepository = services.get<LibraryRepository>();

    return libraryRepository.searchTopicByTitle(
      title: title,
    );
  }
}
