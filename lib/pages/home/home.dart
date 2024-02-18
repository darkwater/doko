import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'subs/search.dart';

part 'home.g.dart';

@Riverpod(keepAlive: true)
MapController mapController(Ref ref) => MapController();

StateProvider<String> searchQueryProvider = StateProvider((ref) => '');

@riverpod
Future<List<Place>> searchResults(Ref ref) async {
  final query = ref.watch(searchQueryProvider);

  if (query.isEmpty) {
    return [];
  }

  final bounds = ref.read(mapControllerProvider).camera.visibleBounds;

  return await Nominatim.searchByName(
    query: query,
    viewBox: ViewBox(bounds.north, bounds.south, bounds.east, bounds.west),
    limit: 20,
    // addressDetails: true,
    // extraTags: true,
    // nameDetails: true,
  );
}

class TheMap extends ConsumerStatefulWidget {
  const TheMap({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TheMap> createState() => _TheMapState();
}

enum SubLocation {
  none,
  saved,
  search,
}

class _TheMapState extends ConsumerState<TheMap> {
  SubLocation subLocation = SubLocation.none;

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(searchResultsProvider).valueOrNull ?? [];
    print(results);

    return Scaffold(
      body: FlutterMap(
        mapController: ref.watch(mapControllerProvider),
        options: const MapOptions(
          initialCenter: LatLng(35.699680629055365, 139.77137788132293),
          initialZoom: 18,
          maxZoom: 18,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            maxZoom: 18,
            maxNativeZoom: 18,
            // retinaMode: RetinaMode.isHighDensity(context),
          ),
          MarkerLayer(
            markers: [
              for (final place in results)
                Marker(
                  point: LatLng(place.lat, place.lon),
                  child: Icon(Icons.place, color: Colors.red),
                ),
            ],
          ),
        ],
      ),
      bottomSheet: subLocation == SubLocation.saved
          ? const Text('Saved')
          : subLocation == SubLocation.search
              ? const SearchSheet()
              : null,
      floatingActionButton: subLocation == SubLocation.search
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () {
                ref.watch(searchQueryProvider.notifier).state = "gigo";

                // setState(() {
                //   subLocation = SubLocation.search;
                // });
              },
            ),
    );
  }
}
