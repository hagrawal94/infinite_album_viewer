import 'package:hive/hive.dart';
import 'package:infinite_album_viewer/features/albums/domain/entities/album_entity.dart';

part 'album_model.g.dart';

@HiveType(typeId: 1)
class AlbumModel extends AlbumEntity {
  @HiveField(0)
  final int albumId;

  @HiveField(1)
  final int albumUserId;

  @HiveField(2)
  final String albumTitle;

  const AlbumModel({
    required this.albumId,
    required this.albumUserId,
    required this.albumTitle,
  }) : super(id: albumId, userId: albumUserId, title: albumTitle);

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      albumId: json['id'],
      albumUserId: json['userId'],
      albumTitle: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': albumId,
      'userId': albumUserId,
      'title': albumTitle,
    };
  }

  factory AlbumModel.fromEntity(AlbumEntity entity) {
    return AlbumModel(
      albumId: entity.id,
      albumUserId: entity.userId,
      albumTitle: entity.title,
    );
  }
}
