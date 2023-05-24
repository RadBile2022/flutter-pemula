
import 'dart:io';
import 'dart:convert';

class FileServices {
  static void saveObjectToFile(Object object, String filename) {
    try {
      var file = File(filename);
      var sink = file.openWrite();

      var json = jsonEncode(object);
      sink.write(json);

      sink.close();
    } catch (ex) {
      print(ex);
    }
  }
}