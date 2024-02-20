import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'subpages/search.dart';
import 'search_layers/search_layers.dart';

part 'home.g.dart';

@Riverpod(keepAlive: true)
MapController mapController(Ref ref) => MapController();

enum SubLocation {
  none,
  saved,
  search,
}

class TheMap extends ConsumerStatefulWidget {
  const TheMap({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TheMap> createState() => _TheMapState();
}

class _TheMapState extends ConsumerState<TheMap> {
  SubLocation subLocation = SubLocation.none;

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(searchResultsProvider).valueOrNull;

    final padding = MediaQuery.of(context).padding;

    final wide = MediaQuery.sizeOf(context).width > 1000;

    final subview = subLocation == SubLocation.saved
        ? const Text('Saved')
        : subLocation == SubLocation.search
            ? SearchSheet(
                shrinkWrap: !wide,
                padding: wide
                    ? padding.copyWith(left: 0)
                    : EdgeInsets.only(
                        bottom: padding.bottom,
                      ),
              )
            : null;

    final showSearchButton = subLocation != SubLocation.search;

    return Scaffold(
      body: Row(
        children: [
          if (subview != null && wide) ...[
            SizedBox(
              width: 400,
              child: subview,
            ),
            VerticalDivider(width: 1, thickness: 1),
          ],
          Expanded(
            child: FlutterMap(
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
                (results ?? NoSearchResults()).mapLayer(context),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: subview != null && !wide ? subview : null,
      floatingActionButton: showSearchButton
          ? FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  subLocation = SubLocation.search;
                });
              },
            )
          : null,
    );
  }
}
