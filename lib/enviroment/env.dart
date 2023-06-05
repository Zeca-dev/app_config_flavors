final class Env {
  static const Map<String, String> _keys = {
    'APP_NAME': String.fromEnvironment("APP_NAME"),
    'SUFFIX_NAME': String.fromEnvironment("SUFFIX_NAME"),
    'BASE_URL': String.fromEnvironment("BASE_URL"),
    'SSO': String.fromEnvironment("SSO")
  };

  static String _getKey(String key) {
    final value = _keys[key] ?? '';

    if (value.isEmpty) {
      throw Exception('$key não definida em Env');
    }

    return value;
  }

  static String get appName => _getKey('APP_NAME');
  static String get suffixName => _getKey('SUFFIX_NAME');
  static String get baseUrl => _getKey('BASE_URL');
  static String get sso => _getKey('SSO');
}
