import 'dart:convert';

import 'package:evermos_pexels/data/model/images.dart';
import 'package:evermos_pexels/data/source/remote/curated/curated_remote_source.dart';
import 'package:http/http.dart' as http;

class CuratedRemoteSourceImpl implements CuratedRemoteSource {
  final http.Client client;

  CuratedRemoteSourceImpl(this.client);

  @override
  Future<Images> getImages(int page) async {
    final url = Uri.https(
      'api.pexels.com',
      '/v1/curated',
      {'page': '$page', 'per_page': '10'},
    );

    final response = await client.get(
      url,
      headers: {
        'Authorization':
            'UEcLH0pmd4E6ETGwFm48CY9IyFaRLKyxDE7vTv10vNUlgDpYcqUf3UMa'
      },
    );

    print('RESPONSE ${jsonDecode(response.body)}');

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body));
    }

    return Images.fromJson(jsonDecode(response.body));
  }
}
