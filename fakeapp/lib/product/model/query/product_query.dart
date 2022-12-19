enum ProductQuery { limit }

extension ProductQueryExtension on ProductQuery {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case ProductQuery.limit:
        return MapEntry('limit', value);
    }
  }
}
