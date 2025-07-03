import 'package:hive/hive.dart';
import '../../domain/entities/photo_entity.dart';

part 'photo_model.g.dart'; // Required for codegen

@HiveType(typeId: 2)
class PhotoModel extends PhotoEntity {
  @HiveField(0)
  final int photoId;

  @HiveField(1)
  final int photoAlbumId;

  @HiveField(2)
  final String photoTitle;

  @HiveField(3)
  final String photoUrl;

  @HiveField(4)
  final String photoThumbnailUrl;

  const PhotoModel({
    required this.photoId,
    required this.photoAlbumId,
    required this.photoTitle,
    required this.photoUrl,
    required this.photoThumbnailUrl,
  }) : super(
          id: photoId,
          albumId: photoAlbumId,
          title: photoTitle,
          url: photoUrl,
          thumbnailUrl: photoThumbnailUrl,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      photoId: json['id'],
      photoAlbumId: json['albumId'],
      photoTitle: json['title'],
      photoUrl: json['url'],
      photoThumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': photoId,
      'albumId': photoAlbumId,
      'title': photoTitle,
      'url': photoUrl,
      'thumbnailUrl': photoThumbnailUrl,
    };
  }

  factory PhotoModel.fromEntity(PhotoEntity entity) {
    return PhotoModel(
      photoId: entity.id,
      photoAlbumId: entity.albumId,
      photoTitle: entity.title,
      photoUrl: entity.url,
      photoThumbnailUrl: entity.thumbnailUrl,
    );
  }
}
