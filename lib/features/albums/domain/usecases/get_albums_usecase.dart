import '../entities/album_entity.dart';
import '../repositories/album_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAlbumsUseCase {
  final AlbumRepository repository;

  GetAlbumsUseCase(this.repository);

  Future<List<AlbumEntity>> call() async {
    return await repository.getAlbums();
  }
}
