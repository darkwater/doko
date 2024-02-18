import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'subs/search.dart';

part 'home.g.dart';

@Riverpod(keepAlive: true)
MapController mapController(Ref ref) => MapController();

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
    return Scaffold(
      body: FlutterMap(
        mapController: ref.watch(mapControllerProvider),
        options: const MapOptions(
          initialCenter: LatLng(35.699680629055365, 139.77137788132293),
          initialZoom: 12,
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
            retinaMode: RetinaMode.isHighDensity(context),
          ),
        ],
      ),
      bottomSheet: subLocation == SubLocation.saved
          ? const Text('Saved')
          : subLocation == SubLocation.search
              ? const SearchSheet()
              : null,
      floatingActionButton: subLocation == SubLocation.none
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () {
                context.go('/search');
              },
            ),
    );
  }
}
