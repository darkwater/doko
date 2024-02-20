import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map.dart';
import 'subpages/search.dart';

enum SubLocation {
  none,
  saved,
  search,
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  SubLocation subLocation = SubLocation.none;

  @override
  Widget build(BuildContext context) {
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
          const Expanded(child: MapView()),
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
