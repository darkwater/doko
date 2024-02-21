// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      id: json['place_id'] as int,
      licence: json['licence'] as String,
      osmType: json['osm_type'] as String,
      osmId: json['osm_id'] as int,
      boundingbox: boundsFromJson(json['boundingbox'] as List?),
      lat: double.parse(json['lat'] as String),
      lon: double.parse(json['lon'] as String),
      displayName: json['display_name'] as String?,
      category: json['category'] as String,
      type: json['type'] as String,
      importance: (json['importance'] as num).toDouble(),
      placeRank: (json['place_rank'] as num).toDouble(),
      icon: json['icon'] == null ? null : Uri.parse(json['icon'] as String),
      address: json['address'] as Map<String, dynamic>?,
      extratags: json['extratags'] as Map<String, dynamic>?,
      namedetails: json['namedetails'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'place_id': instance.id,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'boundingbox': boundsToJson(instance.boundingbox),
      'lat': doubleToString(instance.lat),
      'lon': doubleToString(instance.lon),
      'display_name': instance.displayName,
      'category': instance.category,
      'type': instance.type,
      'importance': instance.importance,
      'place_rank': instance.placeRank,
      'icon': instance.icon?.toString(),
      'address': instance.address,
      'extratags': instance.extratags,
      'namedetails': instance.namedetails,
    };
