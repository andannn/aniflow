
extension MapEx on Map {
  Map<K, V> toMutableMap<K, V>() {
    return {...this};
  }
}