import 'dart:convert';

import 'package:doko/main.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'models.dart';

class Nominatim {
  static final Nominatim _singleton = Nominatim._internal();

  factory Nominatim() {
    return _singleton;
  }

  Nominatim._internal();

  Future<List<Place>> searchByName({
    required String query,
    LatLngBounds? viewbox,
  }) async {
    final res = await dio.get<List<dynamic>>(
      "https://nominatim.openstreetmap.org/search",
      queryParameters: {
        "format": "jsonv2",
        "q": query,
        if (viewbox != null)
          "viewbox":
              "${viewbox.west},${viewbox.south},${viewbox.east},${viewbox.north}",
      },
    );

    if (res.statusCode != 200) {
      throw Exception(
        "Failed to search for $query, status code: ${res.statusCode}",
      );
    }

    return res.data!.toList().map((e) => Place.fromJson(e)).toList();
  }

  Future<Place> reverseSearch({
    required LatLng location,
    int? zoom,
    bool nameDetails = false,
    bool extraTags = false,
  }) async {
    final res = await dio.get(
      "https://nominatim.openstreetmap.org/reverse",
      queryParameters: {
        "format": "jsonv2",
        "lat": location.latitude,
        "lon": location.longitude,
        if (zoom != null) "zoom": zoom,
        "namedetails": nameDetails ? 1 : 0,
        "extratags": extraTags ? 1 : 0,
      },
    );

    if (res.statusCode != 200) {
      throw Exception(
        "Failed to reverse geocode $location, status code: ${res.statusCode}",
      );
    }

    print(jsonEncode(res.data));

    return Place.fromJson(res.data!);
  }
}
