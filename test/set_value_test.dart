import 'package:set_value/set_value.dart';
import 'package:test/test.dart';

void main() {
  group('Test group', () {

    test('Test set function', () {
      var setValue = SetValue();
      var testMap = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {
          'Key 3.1': 'Val 3'
        }
      };

      testMap = setValue.set(testMap, ['Key 4','Key 4.1','Key 4.1.1'], 'Value 4');
      testMap = setValue.set(testMap, ['Key 5'], [
        1,
        2
      ]);

      var assertTest = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {
          'Key 3.1': 'Val 3'
        },
        'Key 4': {
          'Key 4.1': {
            'Key 4.1.1': 'Value 4',
          }
        },
        'Key 5': [
          1, 2
        ]
      };

      expect(testMap, equals(assertTest));
    });

    test('Test unset function', () {
      var setValue = SetValue();
      var testMap = <String, dynamic>{
        'Key 1': 'Val 1',
        'Key 2': 'Val 2',
        'Key 3': {
          'Key 3.1': 'Val 3'
        },
        'Key 5': {
          'Key 5.1': {
            'Key 5.1.2': [
              1,
              2
            ]
          },
          'Key 5.2': {
            'Key 5.2.1': 'Val 5.2.1',
            'Key 5.2.2': 'Val 5.2.2'
          }
        }
      };

      testMap = setValue.unset(testMap, ['Key 5','Key 5.2','Key 5.2.2']);
      testMap = setValue.unset(testMap, ['Key 1']);

      var assertTest = <String, dynamic>{
        'Key 2': 'Val 2',
        'Key 3': {
          'Key 3.1': 'Val 3'
        },
        'Key 5': {
          'Key 5.1': {
            'Key 5.1.2': [
              1,
              2
            ]
          },
          'Key 5.2': {
            'Key 5.2.1': 'Val 5.2.1',
          }
        }
      };

      expect(testMap, equals(assertTest));
    });
  });
}
