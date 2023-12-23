class Base62Converter {
  static const String _characters =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  static String? decode(String base62String) {
    BigInt value = BigInt.zero;
    for (int i = 0; i < base62String.length; i++) {
      int index = _characters.indexOf(base62String[i]);
      value = value * BigInt.from(62) + BigInt.from(index);
    }

    if (value == BigInt.zero) {
      return null; // Return null for invalid input
    }

    List<int> result = [];
    while (value > BigInt.zero) {
      result.insert(0, (value % BigInt.from(256)).toInt());
      value = value ~/ BigInt.from(256);
    }

    return String.fromCharCodes(result);
  }

  static String encode(String inputString) {
    List<int> bytes = inputString.codeUnits;
    BigInt value = BigInt.from(0);
    for (int i = 0; i < bytes.length; i++) {
      value = value << 8 | BigInt.from(bytes[i]);
    }

    String result = '';
    while (value > BigInt.zero) {
      int index = (value % BigInt.from(62)).toInt();
      result = _characters[index] + result;
      value = value ~/ BigInt.from(62);
    }

    return result.isEmpty ? '0' : result;
  }
}
