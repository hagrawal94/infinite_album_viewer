import '../entities/photo_entity.dart';
import '../repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPhotosByAlbumIdUseCase {
  final PhotoRepository repository;

  GetPhotosByAlbumIdUseCase(this.repository);

  Future<List<PhotoEntity>> call(int albumId) async {
    return await repository.getPhotosByAlbumId(albumId);
  }
}
