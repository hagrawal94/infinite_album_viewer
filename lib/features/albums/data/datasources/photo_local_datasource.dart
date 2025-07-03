import 'package:hive/hive.dart';
import '../models/photo_model.dart';
import 'package:injectable/injectable.dart';

abstract class PhotoLocalDatasource {
  Future<void> cachePhotos(int albumId, List<PhotoModel> photos);
  Future<List<PhotoModel>> getCachedPhotos(int albumId);
}

@Injectable(as: PhotoLocalDatasource)
class PhotoLocalDatasourceImpl implements PhotoLocalDatasource {
  final Box<List<PhotoModel>> box;

  PhotoLocalDatasourceImpl(this.box);

  @override
  Future<void> cachePhotos(int albumId, List<PhotoModel> photos) async {
    await box.put(albumId.toString(), photos);
  }

  @override
  Future<List<PhotoModel>> getCachedPhotos(int albumId) async {
    return box.get(albumId.toString(), defaultValue: [])!;
  }
}
