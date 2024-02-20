import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'search_layers/search_layers.dart';
import 'search_layers/tapped_location.dart';

part 'map.g.dart';

@Riverpod(keepAlive: true)
MapController mapController(Ref ref) => MapController();

// StateProvider<LatLng?> mapTappedLocationProvider = StateProvider((ref) => null);

class MapView extends ConsumerWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(searchResultsProvider).valueOrNull;

    return FlutterMap(
      mapController: ref.watch(mapControllerProvider),
      options: MapOptions(
        initialCenter: LatLng(35.699680629055365, 139.77137788132293),
        initialZoom: 16,
        maxZoom: 18,
        interactionOptions: InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        onTap: (point, latlng) {
          // ref.read(mapTappedLocationProvider.notifier).state = latlng;
          ref.read(searchQueryProvider.notifier).state =
              TappedLocationSearchQuery(latlng);
        },
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          maxZoom: 18,
          maxNativeZoom: 18,
          // retinaMode: RetinaMode.isHighDensity(context),
        ),
        (results ?? NoSearchResults()).mapLayer(context),
        // ref.watch(mapTappedLocationLayerProvider) ?? Container(),
      ],
    );
  }
}
