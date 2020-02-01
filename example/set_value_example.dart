import 'package:set_value/set_value.dart';
import 'package:pretty_json/pretty_json.dart';

void main() {
  var mock = <String, dynamic>{
    'Key 1': 'Val 1',
    'Key 2': 'Val 2',
    'Key 3': {'Key 3.1': 'Val 3'}
  };

  var setValue = SetValue();

  /*
  * Below we set three different keys on the map,
  * two of which are nested.
  * */

  mock = setValue.set(mock, ['Key 4'], 'Val 4');
  mock = setValue.set(mock, ['Key 5', 'Key 5.1'], 'Val 5.1');
  mock = setValue.set(mock, ['Key 5', 'Key 5.2'], 'Val 5.2');

  /*
  * Below we remove Key 2 and it's value from the map
  * */

  mock = setValue.unset(mock, ['Key 2']);

  /*
  * Here we expect an output of:
  * {
  *   'Key 1': 'Val 1',
  *   'Key 3': {
  *     'Key 3.1': 'Val 3'
  *   }
  *   'Key 4': 'Val 4',
  *   'Key 5':  {
  *     'Key 5.1': 'Val 5.1',
  *     'Key 5.2': 'Val 5.2'
  *   }
  * }
  * */

  print(prettyJson(mock));
}
