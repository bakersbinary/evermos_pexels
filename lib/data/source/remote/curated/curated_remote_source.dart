import 'package:evermos_pexels/data/model/images.dart';

abstract class CuratedRemoteSource {
  Future<Images> getImages(int page);
}
