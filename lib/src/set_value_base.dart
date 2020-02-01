class SetValue {
  SetValue();

  ///
  /// set
  ///
  /// Takes a json object, path and value,
  /// returns the object with that value set
  /// at the path
  ///
  /// @Map<String,dynamic> target
  /// @List<String> path
  /// @dynamic value
  ///
  Map<String, dynamic> set(
    Map<String, dynamic> target,
    List<String> path,
    dynamic value,
  ) {
    if (!(path is List<String>)) {
      return target;
    }

    if (path.length == 1) {
      _result(target, path[0], value);
      return target;
    }

    var orig = target;
    var len = path.length;

    for (var i = 0; i < len; i++) {
      var prop = path[i];

      if (!(target[prop] is Map<String, dynamic>)) {
        target[prop] = <String, dynamic>{};
      }

      if (i == len - 1) {
        _result(target, prop, value);
        break;
      }

      target = target[prop];
    }

    return orig;
  }

  ///
  /// unset
  ///
  /// Takes a json object and unsets a key
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  ///
  Map<String, dynamic> unset(
    Map<String, dynamic> target,
    List<String> path,
  ) {
    if (!(path is List<String>)) {
      return target;
    }

    if (path.length == 1) {
      target.remove(path[0]);
      return target;
    }

    var orig = target;
    var len = path.length;

    for (var i = 0; i < len; i++) {
      var prop = path[i];

      if (!(target.containsKey(prop))) {
        break;
      }

      if (i == len - 1) {
        target.remove(path[i]);
        break;
      }

      target = target[prop];
    }

    return orig;
  }

  ///
  /// _result
  /// Add a value to the Map key
  ///
  /// @Map<String,dynamic> target
  /// @String path (Map key)
  /// @dynamic value
  ///
  void _result(
    Map<String, dynamic> target,
    String path,
    dynamic value,
  ) {
    target[path] = value;
  }
}
