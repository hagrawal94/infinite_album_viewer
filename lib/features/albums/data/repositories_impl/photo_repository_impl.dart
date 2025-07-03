import '../../domain/entities/photo_entity.dart';
import '../../domain/repositories/photo_repository.dart';
import '../datasources/photo_local_datasource.dart';
import '../datasources/photo_remote_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDatasource remote;
  final PhotoLocalDatasource local;

  PhotoRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<List<PhotoEntity>> getPhotosByAlbumId(int albumId) async {
    try {
      final photos = await remote.fetchPhotosByAlbumId(albumId);
      await local.cachePhotos(albumId, photos);
      return photos;
    } catch (e) {
      final cached = await local.getCachedPhotos(albumId);
      return cached;
    }
  }
}
