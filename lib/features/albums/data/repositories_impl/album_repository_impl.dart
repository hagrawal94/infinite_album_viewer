import '../../domain/entities/album_entity.dart';
import '../../domain/repositories/album_repository.dart';
import '../datasources/album_local_datasource.dart';
import '../datasources/album_remote_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AlbumRepository)
class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDatasource remote;
  final AlbumLocalDatasource local;

  AlbumRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<List<AlbumEntity>> getCachedAlbums() {
    return local.getCachedAlbums();
  }

  @override
  Future<List<AlbumEntity>> getRemoteAlbums() async {
    final albums = await remote.fetchAlbums();
    await local.cacheAlbums(albums);
    return albums;
  }
}
