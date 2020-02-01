# set_value

> Create nested values and any intermediaries using list notation `['a','b',c']` OR dot notation `"a.b.c"`.

This is a `Dart` copy of the `js` project [set-value](https://www.npmjs.com/package/set-value) by [Jon Schlinkert](https://github.com/jonschlinkert).
Please consider following either (or both) projects and starring the projects to show your :heart: and support.
Also, feel free to make pull requests, open issues, or just let me know if I've messed up. The goal is to keep this project in-line with the original as far as possible.
Lastly, please consider following the project author [Ferdin``and Steenkamp](https://github.com/Ferdzzzzzzzz/).


## Install
Install with [pub.dev](https://pub.dev/), add this to your `pubspec.yaml`:

    dependencies:
        set_value:
Then run `flutter pub get`.

## Usage

Import the package:
    
    import 'package:set_value/set_value.dart';

Using `dot` notation:
    
    void main() {
        
        var mock = <String, dynamic>{}
        var setValue = SetValue();
        
        // set a value in a map
        mock = setValue.setDot(mock, 'a.b.c', 'Value');
        
        // unset value in a map
        mock = setValue.unsetDot(mock, 'a.b.c');
    }


Using `List<String>` method:
    
    void main() {
        
        var mock = <String, dynamic>{}
        var setValue = SetValue();
        
        // set a value in a map
        mock = setValue.set(mock, ['a', 'b', 'c'], 'Value');
        
        // unset value in a map
        mock = setValue.unset(mock, ['a', 'b', 'c']);
    }

### About

Pull requests and issues always welcome. There is a lot more information on this project at the original [set-value](https://www.npmjs.com/package/set-value). 

### Author

**Ferdinand Steenkamp**

* [Website](https://ferdzz.com)
* [GitHub Profile](https://github.com/Ferdzzzzzzzz)
* [Twitter Profile](https://twitter.com/therealferdz)
* [LinkedIn Profile](https://www.linkedin.com/in/ferdinand-steenkamp-552335181/)



### License

Copyright © 2012, [Ferdinand Steenkamp](https://github.com/Ferdzzzzzzzz).
Released under the [BSD License](LICENSE).



