import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

class AddFavoriteTopicUseCase extends UseCase<Unit, int> {
  final LibraryRepository libraryRepository = services.get<LibraryServerRepository>();

  @override
  FutureOr<Either<Failure, Unit>> call(int id) {
    return libraryRepository.addFavoriteTopic(
      id: id,
    );
  }
}
