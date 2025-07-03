import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_album_viewer/injection.dart';
import 'core/di/hive_init.dart';
import 'features/albums/presentation/bloc/album/album_bloc.dart';
import 'features/albums/presentation/bloc/photo/photo_bloc.dart';
import 'features/albums/presentation/bloc/album/album_event.dart';
import 'features/albums/presentation/screens/album_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlbumBloc>(
          create: (_) => sl<AlbumBloc>()..add(const FetchAlbumsEvent()),
        ),
        BlocProvider<PhotoBloc>(
          create: (_) => sl<PhotoBloc>(),
        ),
      ],
      child: const MaterialApp(
        home: AlbumListScreen(),
      ),
    );
  }
}
