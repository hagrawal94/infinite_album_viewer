import '../entities/photo_entity.dart';
import '../repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPhotosByAlbumIdUseCase {
  final PhotoRepository repository;

  GetPhotosByAlbumIdUseCase(this.repository);

  Future<List<PhotoEntity>> getCachedPhotos(int albumId) {
    return repository.getCachedPhotos(albumId);
  }

  Future<List<PhotoEntity>> getRemotePhotos(int albumId) {
    return repository.getRemotePhotos(albumId);
  }
}
