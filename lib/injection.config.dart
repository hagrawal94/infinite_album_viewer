// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:infinite_album_viewer/features/albums/data/datasources/album_local_datasource.dart'
    as _i422;
import 'package:infinite_album_viewer/features/albums/data/datasources/album_remote_datasource.dart'
    as _i543;
import 'package:infinite_album_viewer/features/albums/data/datasources/photo_local_datasource.dart'
    as _i750;
import 'package:infinite_album_viewer/features/albums/data/datasources/photo_remote_datasource.dart'
    as _i821;
import 'package:infinite_album_viewer/features/albums/data/models/album_model.dart'
    as _i19;
import 'package:infinite_album_viewer/features/albums/data/models/photo_model.dart'
    as _i253;
import 'package:infinite_album_viewer/features/albums/data/repositories_impl/album_repository_impl.dart'
    as _i115;
import 'package:infinite_album_viewer/features/albums/data/repositories_impl/photo_repository_impl.dart'
    as _i970;
import 'package:infinite_album_viewer/features/albums/domain/repositories/album_repository.dart'
    as _i787;
import 'package:infinite_album_viewer/features/albums/domain/repositories/photo_repository.dart'
    as _i382;
import 'package:infinite_album_viewer/features/albums/domain/usecases/get_albums_usecase.dart'
    as _i464;
import 'package:infinite_album_viewer/features/albums/domain/usecases/get_photos_by_album_id_usecase.dart'
    as _i560;
import 'package:infinite_album_viewer/features/albums/presentation/bloc/album/album_bloc.dart'
    as _i326;
import 'package:infinite_album_viewer/features/albums/presentation/bloc/photo/photo_bloc.dart'
    as _i238;
import 'package:infinite_album_viewer/injection_module.dart' as _i317;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i979.Box<_i19.AlbumModel>>(
      () => registerModule.albumBox,
      preResolve: true,
    );
    await gh.factoryAsync<_i979.Box<List<_i253.PhotoModel>>>(
      () => registerModule.photoBox,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i543.AlbumRemoteDatasource>(
        () => _i543.AlbumRemoteDatasourceImpl(gh<_i361.Dio>()));
    gh.factory<_i750.PhotoLocalDatasource>(() => _i750.PhotoLocalDatasourceImpl(
        gh<_i979.Box<List<_i253.PhotoModel>>>()));
    gh.factory<_i821.PhotoRemoteDatasource>(
        () => _i821.PhotoRemoteDatasourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i382.PhotoRepository>(() => _i970.PhotoRepositoryImpl(
          remote: gh<_i821.PhotoRemoteDatasource>(),
          local: gh<_i750.PhotoLocalDatasource>(),
        ));
    gh.factory<_i422.AlbumLocalDatasource>(
        () => _i422.AlbumLocalDatasourceImpl(gh<_i979.Box<_i19.AlbumModel>>()));
    gh.lazySingleton<_i560.GetPhotosByAlbumIdUseCase>(
        () => _i560.GetPhotosByAlbumIdUseCase(gh<_i382.PhotoRepository>()));
    gh.lazySingleton<_i787.AlbumRepository>(() => _i115.AlbumRepositoryImpl(
          remote: gh<_i543.AlbumRemoteDatasource>(),
          local: gh<_i422.AlbumLocalDatasource>(),
        ));
    gh.factory<_i238.PhotoBloc>(() => _i238.PhotoBloc(
        getPhotosByAlbumIdUseCase: gh<_i560.GetPhotosByAlbumIdUseCase>()));
    gh.lazySingleton<_i464.GetAlbumsUseCase>(
        () => _i464.GetAlbumsUseCase(gh<_i787.AlbumRepository>()));
    gh.factory<_i326.AlbumBloc>(
        () => _i326.AlbumBloc(getAlbumsUseCase: gh<_i464.GetAlbumsUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i317.RegisterModule {}
