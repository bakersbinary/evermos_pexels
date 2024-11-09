import 'package:dartz/dartz.dart';
import 'package:evermos_pexels/core/failure.dart';
import 'package:evermos_pexels/data/source/remote/photos/photos_remote_source.dart';
import 'package:evermos_pexels/domain/entity/image_detail_entity.dart';
import 'package:evermos_pexels/domain/repository/photos_repository.dart';

class PhotosRepositoryImpl implements PhotosRepository {
  final PhotosRemoteSource photosRemoteSource;

  PhotosRepositoryImpl(this.photosRemoteSource);

  @override
  Future<Either<Failure, ImageDetailEntity>> getImageDetail(int id) async {
    try {
      final response = await photosRemoteSource.getImageDetail(id);
      final data = response.toEntity();
      return Right(data);
    } on Exception catch (e) {
      return const Left(
        GeneralFailure(400, 'error'),
      );
    }
  }
}
