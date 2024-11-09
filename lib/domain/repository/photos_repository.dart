import 'package:dartz/dartz.dart';
import 'package:evermos_pexels/core/failure.dart';
import 'package:evermos_pexels/domain/entity/image_detail_entity.dart';

abstract class PhotosRepository {
  Future<Either<Failure, ImageDetailEntity>> getImageDetail(int id);
}
