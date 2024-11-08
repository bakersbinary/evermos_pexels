import 'package:dartz/dartz.dart';
import 'package:evermos_pexels/core/failure.dart';
import 'package:evermos_pexels/domain/entity/images_entity.dart';

abstract class CuratedRepository {
  Future<Either<Failure, List<ImagesEntity>>> getImages(int page);
}
