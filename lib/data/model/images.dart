import 'package:evermos_pexels/domain/entity/images_entity.dart';

class Images {
  int? _page;
  int? _perPage;
  List<Photos>? _photos;
  int? _totalResults;
  String? _nextPage;

  Images(
      {int? page,
      int? perPage,
      List<Photos>? photos,
      int? totalResults,
      String? nextPage}) {
    if (page != null) {
      _page = page;
    }
    if (perPage != null) {
      _perPage = perPage;
    }
    if (photos != null) {
      _photos = photos;
    }
    if (totalResults != null) {
      _totalResults = totalResults;
    }
    if (nextPage != null) {
      _nextPage = nextPage;
    }
  }

  int? get page => _page;

  set page(int? page) => _page = page;

  int? get perPage => _perPage;

  set perPage(int? perPage) => _perPage = perPage;

  List<Photos>? get photos => _photos;

  set photos(List<Photos>? photos) => _photos = photos;

  int? get totalResults => _totalResults;

  set totalResults(int? totalResults) => _totalResults = totalResults;

  String? get nextPage => _nextPage;

  set nextPage(String? nextPage) => _nextPage = nextPage;

  Images.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    _perPage = json['per_page'];
    if (json['photos'] != null) {
      _photos = <Photos>[];
      json['photos'].forEach((v) {
        _photos!.add(new Photos.fromJson(v));
      });
    }
    _totalResults = json['total_results'];
    _nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = _page;
    data['per_page'] = _perPage;
    if (_photos != null) {
      data['photos'] = _photos!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = _totalResults;
    data['next_page'] = _nextPage;
    return data;
  }
}

class Photos {
  int? _id;
  int? _width;
  int? _height;
  String? _url;
  String? _photographer;
  String? _photographerUrl;
  int? _photographerId;
  String? _avgColor;
  Src? _src;
  bool? _liked;
  String? _alt;

  Photos(
      {int? id,
      int? width,
      int? height,
      String? url,
      String? photographer,
      String? photographerUrl,
      int? photographerId,
      String? avgColor,
      Src? src,
      bool? liked,
      String? alt}) {
    if (id != null) {
      _id = id;
    }
    if (width != null) {
      _width = width;
    }
    if (height != null) {
      _height = height;
    }
    if (url != null) {
      _url = url;
    }
    if (photographer != null) {
      _photographer = photographer;
    }
    if (photographerUrl != null) {
      _photographerUrl = photographerUrl;
    }
    if (photographerId != null) {
      _photographerId = photographerId;
    }
    if (avgColor != null) {
      _avgColor = avgColor;
    }
    if (src != null) {
      _src = src;
    }
    if (liked != null) {
      _liked = liked;
    }
    if (alt != null) {
      _alt = alt;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get width => _width;

  set width(int? width) => _width = width;

  int? get height => _height;

  set height(int? height) => _height = height;

  String? get url => _url;

  set url(String? url) => _url = url;

  String? get photographer => _photographer;

  set photographer(String? photographer) => _photographer = photographer;

  String? get photographerUrl => _photographerUrl;

  set photographerUrl(String? photographerUrl) =>
      _photographerUrl = photographerUrl;

  int? get photographerId => _photographerId;

  set photographerId(int? photographerId) => _photographerId = photographerId;

  String? get avgColor => _avgColor;

  set avgColor(String? avgColor) => _avgColor = avgColor;

  Src? get src => _src;

  set src(Src? src) => _src = src;

  bool? get liked => _liked;

  set liked(bool? liked) => _liked = liked;

  String? get alt => _alt;

  set alt(String? alt) => _alt = alt;

  Photos.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _width = json['width'];
    _height = json['height'];
    _url = json['url'];
    _photographer = json['photographer'];
    _photographerUrl = json['photographer_url'];
    _photographerId = json['photographer_id'];
    _avgColor = json['avg_color'];
    _src = json['src'] != null ? new Src.fromJson(json['src']) : null;
    _liked = json['liked'];
    _alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['width'] = _width;
    data['height'] = _height;
    data['url'] = _url;
    data['photographer'] = _photographer;
    data['photographer_url'] = _photographerUrl;
    data['photographer_id'] = _photographerId;
    data['avg_color'] = _avgColor;
    if (_src != null) {
      data['src'] = _src!.toJson();
    }
    data['liked'] = _liked;
    data['alt'] = _alt;
    return data;
  }

  ImagesEntity toEntity() => ImagesEntity(
        id: id ?? 0,
        image: src?.medium ?? '',
        name: photographer ?? '',
        photo: photographerUrl ?? '',
        isLike: liked ?? false,
      );
}

class Src {
  String? _original;
  String? _large2x;
  String? _large;
  String? _medium;
  String? _small;
  String? _portrait;
  String? _landscape;
  String? _tiny;

  Src(
      {String? original,
      String? large2x,
      String? large,
      String? medium,
      String? small,
      String? portrait,
      String? landscape,
      String? tiny}) {
    if (original != null) {
      _original = original;
    }
    if (large2x != null) {
      _large2x = large2x;
    }
    if (large != null) {
      _large = large;
    }
    if (medium != null) {
      _medium = medium;
    }
    if (small != null) {
      _small = small;
    }
    if (portrait != null) {
      _portrait = portrait;
    }
    if (landscape != null) {
      _landscape = landscape;
    }
    if (tiny != null) {
      _tiny = tiny;
    }
  }

  String? get original => _original;

  set original(String? original) => _original = original;

  String? get large2x => _large2x;

  set large2x(String? large2x) => _large2x = large2x;

  String? get large => _large;

  set large(String? large) => _large = large;

  String? get medium => _medium;

  set medium(String? medium) => _medium = medium;

  String? get small => _small;

  set small(String? small) => _small = small;

  String? get portrait => _portrait;

  set portrait(String? portrait) => _portrait = portrait;

  String? get landscape => _landscape;

  set landscape(String? landscape) => _landscape = landscape;

  String? get tiny => _tiny;

  set tiny(String? tiny) => _tiny = tiny;

  Src.fromJson(Map<String, dynamic> json) {
    _original = json['original'];
    _large2x = json['large2x'];
    _large = json['large'];
    _medium = json['medium'];
    _small = json['small'];
    _portrait = json['portrait'];
    _landscape = json['landscape'];
    _tiny = json['tiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = _original;
    data['large2x'] = _large2x;
    data['large'] = _large;
    data['medium'] = _medium;
    data['small'] = _small;
    data['portrait'] = _portrait;
    data['landscape'] = _landscape;
    data['tiny'] = _tiny;
    return data;
  }
}
