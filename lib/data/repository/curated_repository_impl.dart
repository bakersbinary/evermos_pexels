import 'package:dartz/dartz.dart';
import 'package:evermos_pexels/core/failure.dart';
import 'package:evermos_pexels/data/source/remote/curated/curated_remote_source.dart';
import 'package:evermos_pexels/domain/entity/images_entity.dart';
import 'package:evermos_pexels/domain/repository/curated_repository.dart';
import 'package:flutter/foundation.dart';

class CuratedRepositoryImpl implements CuratedRepository {
  final CuratedRemoteSource curatedRemoteSource;

  CuratedRepositoryImpl(this.curatedRemoteSource);

  @override
  Future<Either<Failure, List<ImagesEntity>>> getImages(int page) async {
    try {
      final response = await curatedRemoteSource.getImages(page);
      final data =
          response.photos?.map((item) => item.toEntity()).toList() ?? [];
      return Right(data);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('ERROR $e');
      }
      return const Left(
        GeneralFailure(400, 'error'),
      );
    }
  }
}
