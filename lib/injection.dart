import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart'; // ✅ will be generated

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();
