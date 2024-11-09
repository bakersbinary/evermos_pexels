import 'dart:convert';

import 'package:evermos_pexels/data/model/image_detail.dart';
import 'package:evermos_pexels/data/source/remote/photos/photos_remote_source.dart';
import 'package:http/http.dart' as http;

class PhotosRemoteSourceImpl implements PhotosRemoteSource {
  final http.Client client;

  PhotosRemoteSourceImpl(this.client);

  @override
  Future<ImageDetail> getImageDetail(int id) async {
    final url = Uri.https(
      'api.pexels.com',
      '/v1/photos/$id',
    );

    final response = await client.get(
      url,
      headers: {
        'Authorization':
            'UEcLH0pmd4E6ETGwFm48CY9IyFaRLKyxDE7vTv10vNUlgDpYcqUf3UMa'
      },
    );

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body));
    }

    return ImageDetail.fromJson(jsonDecode(response.body));
  }
}
