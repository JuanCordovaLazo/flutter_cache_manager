import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cache_manager/src/utils/base62_converter.dart';

void main() {
  group('Base62Converter', () {
    test('should encode and decode a base62 string url', () {
      for (var i = 1; i <= 1; i++) {
        for (var j = 1; j <= 2; j++) {
          final url =
              'http://192.168.50.11:3000/api/mobile/get/images/p_${i}_$j.png';
          final encoded = Base62Converter.encode(url);
          final decoded = Base62Converter.decode(encoded);
          debugPrint(url);
          debugPrint(encoded);
          debugPrint(decoded);
          expect(decoded, url);
        }
      }
    });
  });
}
