import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/albums/data/models/album_model.dart';
import '../../features/albums/data/models/photo_model.dart';

class HiveInit {
  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    // Register adapters
    Hive.registerAdapter(AlbumModelAdapter());
    Hive.registerAdapter(PhotoModelAdapter());

    // Open boxes
    await Hive.openBox<AlbumModel>('albums');
    await Hive.openBox<PhotoModel>('photos');
  }
}
