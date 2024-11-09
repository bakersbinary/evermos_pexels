import 'package:evermos_pexels/data/model/image_detail.dart';

abstract class PhotosRemoteSource {
  Future<ImageDetail> getImageDetail(int id);
}