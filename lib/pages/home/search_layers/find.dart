import 'package:doko/pages/home/search_layers/search_layers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

import '../map.dart';

@immutable
class FindSearchQuery extends SearchQuery {
  final String query;

  FindSearchQuery(this.query);

  @override
  Future<SearchResults> resolve(Ref ref) async {
    final bounds = ref.watch(mapControllerProvider).camera.visibleBounds;

    print("searching $query");

    final results = await Nominatim.searchByName(
      query: query,
      viewBox: ViewBox(bounds.north, bounds.south, bounds.east, bounds.west),
    );

    return FindSearchResults(results);
  }
}

class FindSearchResults extends SearchResults {
  final List<Place> results;

  FindSearchResults(this.results);

  @override
  Widget mapLayer(BuildContext context) {
    return MarkerLayer(
      alignment: Alignment.topCenter,
      markers: [
        for (final place in results)
          Marker(
            point: LatLng(place.lat, place.lon),
            width: 40,
            height: 40,
            child: Icon(
              Icons.place,
              color: Colors.redAccent,
              size: 40,
            ),
          ),
      ],
    );
  }
}
