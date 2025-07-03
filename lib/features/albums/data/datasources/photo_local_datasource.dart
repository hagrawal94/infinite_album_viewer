import 'package:hive/hive.dart';
import '../models/photo_model.dart';
import 'package:injectable/injectable.dart';

abstract class PhotoLocalDatasource {
  Future<void> cachePhotos(int albumId, List<PhotoModel> photos);
  Future<List<PhotoModel>> getCachedPhotos(int albumId);
}

@Injectable(as: PhotoLocalDatasource)
class PhotoLocalDatasourceImpl implements PhotoLocalDatasource {
  final Box<PhotoModel> box;

  PhotoLocalDatasourceImpl(this.box);

  @override
  Future<void> cachePhotos(int albumId, List<PhotoModel> photos) async {
    // Clear existing photos for this album
    final keysToDelete = box.keys.where((key) => key.toString().startsWith('$albumId-'));
    await box.deleteAll(keysToDelete);

    for (var photo in photos) {
      await box.put('$albumId-${photo.id}', photo);
    }
  }

  @override
  Future<List<PhotoModel>> getCachedPhotos(int albumId) async {
    return box.values
        .where((photo) => photo.albumId == albumId)
        .toList();
  }
}
