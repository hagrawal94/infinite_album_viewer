import 'package:dio/dio.dart';
import '../models/photo_model.dart';
import 'package:injectable/injectable.dart';

abstract class PhotoRemoteDatasource {
  Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId);
}

@Injectable(as: PhotoRemoteDatasource)
class PhotoRemoteDatasourceImpl implements PhotoRemoteDatasource {
  final Dio dio;

  PhotoRemoteDatasourceImpl(this.dio);

  @override
  Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/photos',
      queryParameters: {'albumId': albumId},
    );
    final data = response.data as List;
    return data.map((json) => PhotoModel.fromJson(json)).toList();
  }
}
