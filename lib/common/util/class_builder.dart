class ClassBuilder {
  static final Map<String, Object> _constructors = <String, Object>{};

  static Map<String, Object> get constructors => _constructors;
  static void register<T>(Object constructor) {
    _constructors[T.toString()] = constructor;
  }

  static Object? fromString(String type) {
    return _constructors[type];
  }
}
