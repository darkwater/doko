// {
//   "place_id": "100149",
//   "licence": "Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright",
//   "osm_type": "node",
//   "osm_id": "107775",
//   "boundingbox": ["51.3473219", "51.6673219", "-0.2876474", "0.0323526"],
//   "lat": "51.5073219",
//   "lon": "-0.1276474",
//   "display_name": "London, Greater London, England, SW1A 2DU, United Kingdom",
//   "class": "place",
//   "type": "city",
//   "importance": 0.9654895765402,
//   "icon": "https://nominatim.openstreetmap.org/images/mapicons/poi_place_city.p.20.png",
//   "address": {
//     "city": "London",
//     "state_district": "Greater London",
//     "state": "England",
//     "ISO3166-2-lvl4": "GB-ENG",
//     "postcode": "SW1A 2DU",
//     "country": "United Kingdom",
//     "country_code": "gb"
//   },
//   "extratags": {
//     "capital": "yes",
//     "website": "http://www.london.gov.uk",
//     "wikidata": "Q84",
//     "wikipedia": "en:London",
//     "population": "8416535"
//   }
// }

import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Place with _$Place {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Place({
    @JsonKey(name: 'place_id') required int id,
    required String licence,
    required String osmType,
    required int osmId,
    @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
    required LatLngBounds? boundingbox,
    @JsonKey(fromJson: double.parse, toJson: doubleToString)
    required double lat,
    @JsonKey(fromJson: double.parse, toJson: doubleToString)
    required double lon,
    required String? displayName,
    required String category,
    required String type,
    required double importance,
    required double placeRank,
    Uri? icon,
    Map<String, dynamic>? address,
    Map<String, dynamic>? extratags,
    Map<String, dynamic>? namedetails,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  const Place._();

  LatLng get latLng => LatLng(lat, lon);

  String? get city => address?['city'] as String?;
  String? get stateDistrict => address?['state_district'] as String?;
  String? get state => address?['state'] as String?;
  String? get postcode => address?['postcode'] as String?;
  String? get country => address?['country'] as String?;
  String? get countryCode => address?['country_code'] as String?;
  String? get road => address?['road'] as String?;
  String? get houseNumber => address?['house_number'] as String?;
  String? get houseName => address?['house_name'] as String?;
}

LatLngBounds? boundsFromJson(List<dynamic>? json) {
  return LatLngBounds(
    LatLng(double.parse(json?[1] as String), double.parse(json?[2] as String)),
    LatLng(double.parse(json?[0] as String), double.parse(json?[3] as String)),
  );
}

List<dynamic>? boundsToJson(LatLngBounds? bounds) {
  return [
    bounds?.south,
    bounds?.north,
    bounds?.west,
    bounds?.east,
  ];
}

String doubleToString(double value) {
  return value.toString();
}
