import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

class AddTopicUseCase extends UseCase<Topic, Topic> {
  final LibraryRepository libraryRepository;

  AddTopicUseCase({
    required this.libraryRepository,
  });
  @override
  Future<Either<Failure, Topic>> call(Topic params) async {
    Either<Failure, Unit> newTopic = await libraryRepository.addTopic(
      title: params.title,
      data: params.data,
      links: params.links,
    );

    return right(newTopic as Topic);
  }
}
