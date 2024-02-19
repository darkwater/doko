import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home.dart';

part 'search.g.dart';

class SearchQuery {
  final String query;

  /// If true, when a result is found, the map should just go there.
  final bool go;

  SearchQuery({required this.query, required this.go});

  bool get isEmpty => query.isEmpty;
}

StateProvider<SearchQuery> searchQueryProvider = StateProvider(
  (ref) => SearchQuery(query: "", go: false),
);

@riverpod
Future<List<Place>> searchResults(Ref ref) async {
  final query = ref.watch(searchQueryProvider);

  if (query.isEmpty) {
    return [];
  }

  final bounds = ref.read(mapControllerProvider).camera.visibleBounds;

  return await Nominatim.searchByName(
    query: query.query,
    viewBox: ViewBox(bounds.north, bounds.south, bounds.east, bounds.west),
    limit: 20,
    // addressDetails: true,
    // extraTags: true,
    // nameDetails: true,
  );
}
