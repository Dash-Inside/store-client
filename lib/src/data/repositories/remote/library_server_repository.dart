import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

@Injectable(as: LibraryRepository)
class LibraryServerRepository implements LibraryRepository {
  @override
  Future<Either<Failure, Unit>> addFavoriteTopic({required int id}) {
    // TODO: implement addFavoriteTopic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addTopic({required String title, required String data, required List<String> links}) {
    // TODO: implement addTopic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Section>>> getAllSections() {
    // TODO: implement getAllSections
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Topic>>> getAllTopicsBySectionID({required int id}) {
    // TODO: implement getAllTopicsBySectionID
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Topic>> getTopicDataByID({required int id}) {
    // TODO: implement getTopicDataByID
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeFavoriteTopic({required int id}) {
    // TODO: implement removeFavoriteTopic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Topic>>> searchTopicByTitle({required String title}) {
    // TODO: implement searchTopicByTitle
    throw UnimplementedError();
  }
}
