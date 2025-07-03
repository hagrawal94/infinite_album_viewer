import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveInit {
  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    
    // Register adapters here when you create them
    // Example: Hive.registerAdapter(AlbumModelAdapter());
    
    // Open boxes here
    // Example: await Hive.openBox<AlbumModel>('albums');
  }
} 