import '../entities/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<Album> getAlbumById(int id);
  Future<List<Album>> getAlbumsByUserId(int userId);
} 