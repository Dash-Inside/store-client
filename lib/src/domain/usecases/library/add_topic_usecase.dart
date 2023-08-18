import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

class AddTopicUseCase extends UseCase<Unit, AddTopicUseCaseParams> {
  final LibraryRepository libraryRepository = services.get<LibraryRepository>();

  @override
  FutureOr<Either<Failure, Unit>> call(AddTopicUseCaseParams params) async {
    return libraryRepository.addTopic(
      title: params.title,
      data: params.data,
      links: params.links,
    );
  }
}

class AddTopicUseCaseParams {
  final String title;
  final String data;
  final List<String> links;

  AddTopicUseCaseParams(
    this.title,
    this.data,
    this.links,
  );
}
