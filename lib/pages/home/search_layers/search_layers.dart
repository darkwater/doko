import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_layers.g.dart';

StateProvider<SearchQuery?> searchQueryProvider = StateProvider((ref) => null);

abstract class SearchQuery {
  Future<SearchResults> resolve(Ref ref);
}

@riverpod
Future<SearchResults> searchResults(Ref ref) async {
  final query = ref.watch(searchQueryProvider);

  if (query == null) {
    print("query empty");
    return NoSearchResults();
  }

  try {
    return await query.resolve(ref);
  } catch (e) {
    print(e);
    return NoSearchResults();
  }
}

@immutable
abstract class SearchResults {
  Widget mapLayer(BuildContext context);
}

class NoSearchResults extends SearchResults {
  @override
  Widget mapLayer(BuildContext context) {
    return Container();
  }
}
