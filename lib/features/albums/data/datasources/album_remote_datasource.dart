import 'package:dio/dio.dart';
import '../models/album_model.dart';
import 'package:injectable/injectable.dart';

abstract class AlbumRemoteDatasource {
  Future<List<AlbumModel>> fetchAlbums();
}

@Injectable(as: AlbumRemoteDatasource)
class AlbumRemoteDatasourceImpl implements AlbumRemoteDatasource {
  final Dio dio;

  AlbumRemoteDatasourceImpl(this.dio);

  @override
  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/albums');
    final data = response.data as List;
    return data.map((json) => AlbumModel.fromJson(json)).toList();
  }
}
