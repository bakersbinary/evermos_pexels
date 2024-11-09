import 'package:evermos_pexels/data/repository/curated_repository_impl.dart';
import 'package:evermos_pexels/data/repository/photos_repository_impl.dart';
import 'package:evermos_pexels/data/source/remote/curated/curated_remote_source.dart';
import 'package:evermos_pexels/data/source/remote/curated/curated_remote_source_impl.dart';
import 'package:evermos_pexels/data/source/remote/photos/photos_remote_source.dart';
import 'package:evermos_pexels/data/source/remote/photos/photos_remote_source_impl.dart';
import 'package:evermos_pexels/domain/repository/curated_repository.dart';
import 'package:evermos_pexels/domain/repository/photos_repository.dart';
import 'package:evermos_pexels/domain/usecase/curated_usecase.dart';
import 'package:evermos_pexels/domain/usecase/photos_usecase.dart';
import 'package:evermos_pexels/presentation/image_detail/bloc/image_detail_bloc.dart';
import 'package:evermos_pexels/presentation/images/bloc/images_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void initialize() {
  getIt.registerFactory(() => http.Client());

  getIt.registerFactory<CuratedRemoteSource>(
      () => CuratedRemoteSourceImpl(getIt()));
  getIt.registerFactory<PhotosRemoteSource>(
      () => PhotosRemoteSourceImpl(getIt()));

  getIt
      .registerFactory<CuratedRepository>(() => CuratedRepositoryImpl(getIt()));
  getIt.registerFactory<PhotosRepository>(() => PhotosRepositoryImpl(getIt()));

  getIt.registerFactory(() => CuratedUseCase(getIt()));
  getIt.registerFactory(() => PhotosUseCase(getIt()));

  getIt.registerFactory(() => ImagesBloc(getIt()));
  getIt.registerFactory(() => ImageDetailBloc(getIt()));
}
