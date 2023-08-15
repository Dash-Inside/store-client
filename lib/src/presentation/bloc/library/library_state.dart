part of 'library_bloc.dart';

sealed class LibraryState extends Equatable {
  @override
  List<Object> get props => [];

  const LibraryState();
}

final class InitLibraryState extends LibraryState {}
