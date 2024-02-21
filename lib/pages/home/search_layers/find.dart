import 'package:doko/api/nominatim/models.dart';
import 'package:doko/api/nominatim/nominatim.dart';
import 'package:doko/pages/home/search_layers/search_layers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../map.dart';

@immutable
class FindSearchQuery extends SearchQuery {
  final String query;

  FindSearchQuery(this.query);

  @override
  Future<SearchResults> resolve(Ref ref) async {
    print("searching $query");

    final results = await Nominatim().searchByName(
      query: query,
      viewbox: ref.watch(mapControllerProvider).camera.visibleBounds,
    );

    print("found ${results.length} results");

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
            point: place.latLng,
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
