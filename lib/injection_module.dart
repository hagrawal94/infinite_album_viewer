import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

import '/features/albums/data/models/album_model.dart';
import '/features/albums/data/models/photo_model.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();

  @preResolve
  Future<Box<AlbumModel>> get albumBox => Hive.openBox<AlbumModel>('albums');

  @preResolve
  Future<Box<PhotoModel>> get photoBox => Hive.openBox<PhotoModel>('photos');
}
