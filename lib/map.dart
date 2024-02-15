import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'map.g.dart';

@Riverpod(keepAlive: true)
MapController mapController(Ref ref) => MapController();

class TheMap extends ConsumerWidget {
  final bool saved;
  final bool search;

  const TheMap({
    Key? key,
    this.saved = false,
    this.search = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FlutterMap(
        mapController: ref.watch(mapControllerProvider),
        options: const MapOptions(
          initialCenter: LatLng(35.699680629055365, 139.77137788132293),
          initialZoom: 16,
          maxZoom: 20,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "red.dark.doko",
            retinaMode: MediaQuery.of(context).devicePixelRatio > 1.5,
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                "OpenStreetMap",
                onTap: () => launchUrl(
                  Uri.parse("https://openstreetmap.org/copyright"),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: saved
          ? const Text('Saved')
          : search
              ? const Text('Search')
              : null,
      floatingActionButton: search
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () => context.go('/search'),
            ),
    );
  }
}
