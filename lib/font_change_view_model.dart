import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class FontChangeViewModel extends ChangeNotifier {
  String fontFamily;
  File _file; //dart.ioの方

  void changeFont() async {

    try {
      _file = await FilePicker.getFile();
    } on PlatformException catch(e) {
      print("Unsupported operation" + e.toString());
    }
    //Fileからファイル名（banenameメソッド）
    //https://stackoverflow.com/questions/50439949/flutter-get-the-filename-of-a-file
    fontFamily = basename(_file.path);
    final fontData = _loadFont(_file);
    final fontLoader = FontLoader(fontFamily);
    fontLoader.addFont(fontData);
    await fontLoader.load();

    notifyListeners();
  }

  Future<ByteData> _loadFont(File file) {
    final bytes = Uint8List.fromList(file.readAsBytesSync());
    return Future.value(ByteData.view(bytes.buffer));
  }
}