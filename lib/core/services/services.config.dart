// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:store_client/core/services/services.dart' as _i8;
import 'package:store_client/src/data/datasources/library_server_datasource.dart'
    as _i16;
import 'package:store_client/src/data/datasources/messenger_server_datasource.dart'
    as _i20;
import 'package:store_client/src/data/datasources/user_server_datasource.dart'
    as _i26;
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart'
    as _i15;
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart'
    as _i29;
import 'package:store_client/src/data/repositories/remote/user_server_repository.dart'
    as _i31;
import 'package:store_client/src/domain/repository/library_repository.dart'
    as _i14;
import 'package:store_client/src/domain/repository/messenger_repository.dart'
    as _i28;
import 'package:store_client/src/domain/repository/user_repository.dart'
    as _i30;
import 'package:store_client/src/domain/usecases/library/add_favorite_topic_usecase.dart'
    as _i4;
import 'package:store_client/src/domain/usecases/library/add_topic_usecase.dart'
    as _i5;
import 'package:store_client/src/domain/usecases/library/get_all_sections_usecase.dart'
    as _i10;
import 'package:store_client/src/domain/usecases/library/get_all_topics_by_section_id_usecase.dart'
    as _i11;
import 'package:store_client/src/domain/usecases/library/get_topic_by_id_usecase.dart'
    as _i12;
import 'package:store_client/src/domain/usecases/library/remove_favorite_topic_usecase.dart'
    as _i21;
import 'package:store_client/src/domain/usecases/library/search_topic_by_title_usecase.dart'
    as _i24;
import 'package:store_client/src/domain/usecases/messenger/fetch_messages_usecase.dart'
    as _i9;
import 'package:store_client/src/domain/usecases/messenger/send_message_usecase.dart'
    as _i25;
import 'package:store_client/src/domain/usecases/user_data/change_avatar_url_usecase.dart'
    as _i6;
import 'package:store_client/src/domain/usecases/user_data/change_username_usecase.dart'
    as _i7;
import 'package:store_client/src/domain/usecases/user_data/log_in_usecase.dart'
    as _i17;
import 'package:store_client/src/domain/usecases/user_data/recheck_token_usecase.dart'
    as _i32;
import 'package:store_client/src/domain/usecases/user_data/restore_password_usecase.dart'
    as _i23;
import 'package:store_client/src/presentation/app.dart' as _i35;
import 'package:store_client/src/presentation/bloc/auth/auth_bloc.dart' as _i33;
import 'package:store_client/src/presentation/bloc/messenger/messenger_bloc.dart'
    as _i19;
import 'package:store_client/src/presentation/pages/account_page.dart' as _i3;
import 'package:store_client/src/presentation/pages/chat_page.dart' as _i27;
import 'package:store_client/src/presentation/pages/library_page.dart' as _i13;
import 'package:store_client/src/presentation/pages/log_in_page.dart' as _i34;
import 'package:store_client/src/presentation/pages/markdown_page.dart' as _i18;
import 'package:store_client/src/presentation/pages/restore_page.dart' as _i22;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt generate({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AccountPage>(() => _i3.AccountPage());
    gh.factory<_i4.AddFavoriteTopicUseCase>(
        () => _i4.AddFavoriteTopicUseCase());
    gh.factory<_i5.AddTopicUseCase>(() => _i5.AddTopicUseCase());
    gh.factory<_i6.ChangeAvatarUrlUseCase>(() => _i6.ChangeAvatarUrlUseCase());
    gh.factory<_i7.ChangeUserNameUseCase>(() => _i7.ChangeUserNameUseCase());
    gh.factory<_i8.DioModule>(() => _i8.DioModule());
    gh.factory<_i9.FetchMessagesUseCase>(() => _i9.FetchMessagesUseCase());
    gh.factory<_i10.GetAllSectionsUseCase>(() => _i10.GetAllSectionsUseCase());
    gh.factory<_i11.GetAllTopicsBySectionIDUseCase>(
        () => _i11.GetAllTopicsBySectionIDUseCase());
    gh.factory<_i12.GetTopicByIDUseCase>(() => _i12.GetTopicByIDUseCase());
    gh.factory<_i13.LibraryPage>(() => _i13.LibraryPage());
    gh.factory<_i14.LibraryRepository>(() => _i15.LibraryServerRepository());
    gh.factory<_i16.LibraryServerDatasource>(
        () => _i16.LibraryServerDatasource());
    gh.factory<_i17.LogInUseCase>(() => _i17.LogInUseCase());
    gh.factory<_i18.MarkdownPage>(() => const _i18.MarkdownPage());
    gh.singleton<_i19.MessengerBloc>(_i19.MessengerBloc());
    gh.factory<_i20.MessengerServerDatasource>(
        () => _i20.MessengerServerDatasource(dioModule: gh<_i8.DioModule>()));
    gh.factory<_i21.RemoveFavoriteTopicUseCase>(
        () => _i21.RemoveFavoriteTopicUseCase());
    gh.factory<_i22.RestorePage>(() => _i22.RestorePage());
    gh.factory<_i23.RestorePasswordUseCase>(
        () => _i23.RestorePasswordUseCase());
    gh.factory<_i24.SearchTopicByTitleUseCase>(
        () => _i24.SearchTopicByTitleUseCase());
    gh.factory<_i8.SecureModule>(() => _i8.SecureModule());
    gh.factory<_i25.SendMessageUsecase>(() => _i25.SendMessageUsecase());
    gh.factory<_i26.UserServerDatasource>(() => _i26.UserServerDatasource(
          dioModule: gh<_i8.DioModule>(),
          secureModule: gh<_i8.SecureModule>(),
        ));
    gh.factory<_i27.ChatPage>(
        () => _i27.ChatPage(messengerBloc: gh<_i19.MessengerBloc>()));
    gh.factory<_i28.MessengerRepository>(() => _i29.MessengerServerRepository(
        messengerServerDatasource: gh<_i20.MessengerServerDatasource>()));
    gh.factory<_i30.UserRepository>(() => _i31.UserServerRepository(
        userServerDatasource: gh<_i26.UserServerDatasource>()));
    gh.factory<_i32.RecheckTokenUseCase>(() =>
        _i32.RecheckTokenUseCase(userRepository: gh<_i30.UserRepository>()));
    gh.singleton<_i33.AuthBloc>(_i33.AuthBloc(
      recheckTokenUseCase: gh<_i32.RecheckTokenUseCase>(),
      logInUseCase: gh<_i17.LogInUseCase>(),
    ));
    gh.factory<_i34.LoginPage>(
        () => _i34.LoginPage(authBloc: gh<_i33.AuthBloc>()));
    gh.factory<_i35.App>(() => _i35.App(authBloc: gh<_i33.AuthBloc>()));
    return this;
  }
}
