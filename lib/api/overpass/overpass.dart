class Overpass {
  static final Overpass _singleton = Overpass._internal();

  factory Overpass() {
    return _singleton;
  }

  Overpass._internal();
}
