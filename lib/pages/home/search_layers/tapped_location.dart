import 'package:doko/pages/home/search_layers/search_layers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

import '../map.dart';

// part 'tapped_location.g.dart';

@immutable
class TappedLocationSearchQuery extends SearchQuery {
  final LatLng location;

  TappedLocationSearchQuery(this.location);

  @override
  Future<SearchResults> resolve(Ref ref) async {
    print(ref.read(mapControllerProvider).camera.zoom.round());

    final res = await Nominatim.reverseSearch(
      lat: location.latitude,
      lon: location.longitude,
      zoom: ref.read(mapControllerProvider).camera.zoom.round(),
      nameDetails: true,
      extraTags: true,
    );

    return TappedLocationSearchResults(res);
  }
}

@immutable
class TappedLocationSearchResults extends SearchResults {
  final Place result;

  TappedLocationSearchResults(this.result);

  @override
  Widget mapLayer(BuildContext context) {
    print(result.category);
    print(result.nameDetails);
    print(result.displayName);

    return MarkerLayer(
      alignment: Alignment.topCenter,
      markers: [
        Marker(
          point: LatLng(result.lat, result.lon),
          width: 40,
          height: 40,
          child: Icon(
            Icons.place,
            color: Colors.blueAccent,
            size: 40,
          ),
        ),
      ],
    );
  }
}

// @riverpod
// Widget? mapTappedLocationLayer(Ref ref) {
//   final location = ref.watch(mapTappedLocationProvider);
//   if (location == null) {
//     return null;
//   }

//   return MarkerLayer(
//     alignment: Alignment.topCenter,
//     markers: [
//       Marker(
//         point: location,
//         width: 40,
//         height: 40,
//         child: Icon(
//           Icons.place,
//           color: Colors.blueAccent,
//           size: 40,
//         ),
//       ),
//     ],
//   );
// }
