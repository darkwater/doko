// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  @JsonKey(name: 'place_id')
  int get id => throw _privateConstructorUsedError;
  String get licence => throw _privateConstructorUsedError;
  String get osmType => throw _privateConstructorUsedError;
  int get osmId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
  LatLngBounds? get boundingbox => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.parse, toJson: doubleToString)
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(fromJson: double.parse, toJson: doubleToString)
  double get lon => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get importance => throw _privateConstructorUsedError;
  double get placeRank => throw _privateConstructorUsedError;
  Uri? get icon => throw _privateConstructorUsedError;
  Map<String, dynamic>? get address => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extratags => throw _privateConstructorUsedError;
  Map<String, dynamic>? get namedetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') int id,
      String licence,
      String osmType,
      int osmId,
      @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
      LatLngBounds? boundingbox,
      @JsonKey(fromJson: double.parse, toJson: doubleToString) double lat,
      @JsonKey(fromJson: double.parse, toJson: doubleToString) double lon,
      String? displayName,
      String category,
      String type,
      double importance,
      double placeRank,
      Uri? icon,
      Map<String, dynamic>? address,
      Map<String, dynamic>? extratags,
      Map<String, dynamic>? namedetails});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? licence = null,
    Object? osmType = null,
    Object? osmId = null,
    Object? boundingbox = freezed,
    Object? lat = null,
    Object? lon = null,
    Object? displayName = freezed,
    Object? category = null,
    Object? type = null,
    Object? importance = null,
    Object? placeRank = null,
    Object? icon = freezed,
    Object? address = freezed,
    Object? extratags = freezed,
    Object? namedetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      licence: null == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String,
      osmType: null == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String,
      osmId: null == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int,
      boundingbox: freezed == boundingbox
          ? _value.boundingbox
          : boundingbox // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double,
      placeRank: null == placeRank
          ? _value.placeRank
          : placeRank // ignore: cast_nullable_to_non_nullable
              as double,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uri?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      extratags: freezed == extratags
          ? _value.extratags
          : extratags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      namedetails: freezed == namedetails
          ? _value.namedetails
          : namedetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') int id,
      String licence,
      String osmType,
      int osmId,
      @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
      LatLngBounds? boundingbox,
      @JsonKey(fromJson: double.parse, toJson: doubleToString) double lat,
      @JsonKey(fromJson: double.parse, toJson: doubleToString) double lon,
      String? displayName,
      String category,
      String type,
      double importance,
      double placeRank,
      Uri? icon,
      Map<String, dynamic>? address,
      Map<String, dynamic>? extratags,
      Map<String, dynamic>? namedetails});
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? licence = null,
    Object? osmType = null,
    Object? osmId = null,
    Object? boundingbox = freezed,
    Object? lat = null,
    Object? lon = null,
    Object? displayName = freezed,
    Object? category = null,
    Object? type = null,
    Object? importance = null,
    Object? placeRank = null,
    Object? icon = freezed,
    Object? address = freezed,
    Object? extratags = freezed,
    Object? namedetails = freezed,
  }) {
    return _then(_$PlaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      licence: null == licence
          ? _value.licence
          : licence // ignore: cast_nullable_to_non_nullable
              as String,
      osmType: null == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String,
      osmId: null == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int,
      boundingbox: freezed == boundingbox
          ? _value.boundingbox
          : boundingbox // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as double,
      placeRank: null == placeRank
          ? _value.placeRank
          : placeRank // ignore: cast_nullable_to_non_nullable
              as double,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uri?,
      address: freezed == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      extratags: freezed == extratags
          ? _value._extratags
          : extratags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      namedetails: freezed == namedetails
          ? _value._namedetails
          : namedetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PlaceImpl extends _Place {
  const _$PlaceImpl(
      {@JsonKey(name: 'place_id') required this.id,
      required this.licence,
      required this.osmType,
      required this.osmId,
      @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
      required this.boundingbox,
      @JsonKey(fromJson: double.parse, toJson: doubleToString)
      required this.lat,
      @JsonKey(fromJson: double.parse, toJson: doubleToString)
      required this.lon,
      required this.displayName,
      required this.category,
      required this.type,
      required this.importance,
      required this.placeRank,
      this.icon,
      final Map<String, dynamic>? address,
      final Map<String, dynamic>? extratags,
      final Map<String, dynamic>? namedetails})
      : _address = address,
        _extratags = extratags,
        _namedetails = namedetails,
        super._();

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final int id;
  @override
  final String licence;
  @override
  final String osmType;
  @override
  final int osmId;
  @override
  @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
  final LatLngBounds? boundingbox;
  @override
  @JsonKey(fromJson: double.parse, toJson: doubleToString)
  final double lat;
  @override
  @JsonKey(fromJson: double.parse, toJson: doubleToString)
  final double lon;
  @override
  final String? displayName;
  @override
  final String category;
  @override
  final String type;
  @override
  final double importance;
  @override
  final double placeRank;
  @override
  final Uri? icon;
  final Map<String, dynamic>? _address;
  @override
  Map<String, dynamic>? get address {
    final value = _address;
    if (value == null) return null;
    if (_address is EqualUnmodifiableMapView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _extratags;
  @override
  Map<String, dynamic>? get extratags {
    final value = _extratags;
    if (value == null) return null;
    if (_extratags is EqualUnmodifiableMapView) return _extratags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _namedetails;
  @override
  Map<String, dynamic>? get namedetails {
    final value = _namedetails;
    if (value == null) return null;
    if (_namedetails is EqualUnmodifiableMapView) return _namedetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Place(id: $id, licence: $licence, osmType: $osmType, osmId: $osmId, boundingbox: $boundingbox, lat: $lat, lon: $lon, displayName: $displayName, category: $category, type: $type, importance: $importance, placeRank: $placeRank, icon: $icon, address: $address, extratags: $extratags, namedetails: $namedetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.licence, licence) || other.licence == licence) &&
            (identical(other.osmType, osmType) || other.osmType == osmType) &&
            (identical(other.osmId, osmId) || other.osmId == osmId) &&
            (identical(other.boundingbox, boundingbox) ||
                other.boundingbox == boundingbox) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.placeRank, placeRank) ||
                other.placeRank == placeRank) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            const DeepCollectionEquality()
                .equals(other._extratags, _extratags) &&
            const DeepCollectionEquality()
                .equals(other._namedetails, _namedetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      licence,
      osmType,
      osmId,
      boundingbox,
      lat,
      lon,
      displayName,
      category,
      type,
      importance,
      placeRank,
      icon,
      const DeepCollectionEquality().hash(_address),
      const DeepCollectionEquality().hash(_extratags),
      const DeepCollectionEquality().hash(_namedetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place extends Place {
  const factory _Place(
      {@JsonKey(name: 'place_id') required final int id,
      required final String licence,
      required final String osmType,
      required final int osmId,
      @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
      required final LatLngBounds? boundingbox,
      @JsonKey(fromJson: double.parse, toJson: doubleToString)
      required final double lat,
      @JsonKey(fromJson: double.parse, toJson: doubleToString)
      required final double lon,
      required final String? displayName,
      required final String category,
      required final String type,
      required final double importance,
      required final double placeRank,
      final Uri? icon,
      final Map<String, dynamic>? address,
      final Map<String, dynamic>? extratags,
      final Map<String, dynamic>? namedetails}) = _$PlaceImpl;
  const _Place._() : super._();

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  @JsonKey(name: 'place_id')
  int get id;
  @override
  String get licence;
  @override
  String get osmType;
  @override
  int get osmId;
  @override
  @JsonKey(fromJson: boundsFromJson, toJson: boundsToJson)
  LatLngBounds? get boundingbox;
  @override
  @JsonKey(fromJson: double.parse, toJson: doubleToString)
  double get lat;
  @override
  @JsonKey(fromJson: double.parse, toJson: doubleToString)
  double get lon;
  @override
  String? get displayName;
  @override
  String get category;
  @override
  String get type;
  @override
  double get importance;
  @override
  double get placeRank;
  @override
  Uri? get icon;
  @override
  Map<String, dynamic>? get address;
  @override
  Map<String, dynamic>? get extratags;
  @override
  Map<String, dynamic>? get namedetails;
  @override
  @JsonKey(ignore: true)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
