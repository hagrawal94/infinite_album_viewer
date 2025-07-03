import '../entities/album_entity.dart';

abstract class AlbumRepository {
  Future<List<AlbumEntity>> getAlbums();
} 