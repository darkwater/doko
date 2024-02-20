import "package:doko/pages/home/search_layers/find.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../search_layers/search_layers.dart";

enum SearchMode {
  go,
  find,
  explore,
}

StateProvider<SearchMode> searchModeProvider = StateProvider(
  (ref) => SearchMode.go,
);

class SearchSheet extends HookConsumerWidget {
  final EdgeInsets padding;
  final bool shrinkWrap;

  const SearchSheet({
    Key? key,
    required this.padding,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 200,
      ),
      child: ListView(
        shrinkWrap: shrinkWrap,
        padding: padding,
        children: [
          SizedBox(height: 4),
          if (ref.watch(searchModeProvider) != SearchMode.explore)
            Row(
              children: [
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onSubmitted: (value) {
                      if (ref.watch(searchModeProvider) == SearchMode.find) {
                        ref.read(searchQueryProvider.notifier).state =
                            FindSearchQuery(value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            )
          else
            SizedBox(height: 16),
          SegmentedButton<SearchMode>(
            multiSelectionEnabled: false,
            selected: {ref.watch(searchModeProvider)},
            segments: [
              ButtonSegment(value: SearchMode.go, label: Text("Go")),
              ButtonSegment(value: SearchMode.find, label: Text("Find")),
              ButtonSegment(value: SearchMode.explore, label: Text("Explore")),
            ],
            onSelectionChanged: (value) {
              ref.read(searchModeProvider.notifier).state = value.first;
            },
          ),
          if (ref.watch(searchResultsProvider).isLoading)
            LinearProgressIndicator(),
          if (ref.watch(searchModeProvider) == SearchMode.explore)
            ListTile(
              title: const Text("Explore..."),
            ),
        ],
      ),
    );
  }
}
