import '../entities/photo_entity.dart';

abstract class PhotoRepository {
  Future<List<PhotoEntity>> getCachedPhotos(int albumId);
  Future<List<PhotoEntity>> getRemotePhotos(int albumId);
}
