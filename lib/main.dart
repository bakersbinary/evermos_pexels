import 'package:evermos_pexels/presentation/image_detail/bloc/image_detail_bloc.dart';
import 'package:evermos_pexels/presentation/image_detail/image_detail_screen.dart';
import 'package:evermos_pexels/presentation/images/bloc/images_bloc.dart';
import 'package:evermos_pexels/presentation/images/images_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injector.dart' as injector;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  injector.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector.getIt<ImagesBloc>()),
        BlocProvider(create: (context) => injector.getIt<ImageDetailBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const ImagesScreen(),
          '/image_detail': (context) => const ImageDetailScreen(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
