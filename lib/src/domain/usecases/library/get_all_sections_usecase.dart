import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

class GetAllSectionsUseCase extends UseCase<List<Section>, Unit> {
  @override
  FutureOr<Either<Failure, List<Section>>> call(Unit) {
    final LibraryRepository libraryRepository =
        services.get<LibraryRepository>();

    return libraryRepository.getAllSections();
  }
}
