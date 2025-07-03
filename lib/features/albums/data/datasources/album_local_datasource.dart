import 'package:hive/hive.dart';
import '../models/album_model.dart';
import 'package:injectable/injectable.dart';

abstract class AlbumLocalDatasource {
  Future<void> cacheAlbums(List<AlbumModel> albums);
  Future<List<AlbumModel>> getCachedAlbums();
}

@Injectable(as: AlbumLocalDatasource)
class AlbumLocalDatasourceImpl implements AlbumLocalDatasource {
  final Box<AlbumModel> box;

  AlbumLocalDatasourceImpl(this.box);

  @override
  Future<void> cacheAlbums(List<AlbumModel> albums) async {
    await box.clear(); // You could also merge
    for (var album in albums) {
      await box.put(album.albumId, album);
    }
  }

  @override
  Future<List<AlbumModel>> getCachedAlbums() async {
    return box.values.toList();
  }
}
