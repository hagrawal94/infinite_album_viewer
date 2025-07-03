import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
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
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/albums',
        options: Options(
          headers: {
            'User-Agent': 'Dart/Flutter',
            'Accept': 'application/json',
          },
        ),
      );
      final data = response.data as List;
      return data.map((json) => AlbumModel.fromJson(json)).toList();
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
