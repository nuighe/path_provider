import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ScoreData{
  // hàm bất đồng bộ để đọc, ghi dữ liệu.
  static Future<String> get getFilePath async{
    final Directory directory = await getApplicationDocumentsDirectory(); // đợi máy tính đọc hết dữ liệu trong file
    print(directory.path);
    return directory.path;
  }
  //mở file
  static Future<File> get getFile async{
    final path = await getFilePath;
    print('$path/score.txt');
    return File('$path/score.txt');
  }
  // đọc file
  static Future<String> readScore() async{
    try{
      final file = await getFile;
      String fileContents = await file.readAsString();
      return fileContents;
    }catch(e){
      print('Error $e');
      return 'Error';
    }
  }
  // lưu vào file
  static Future<File> saveScore(String score) async{
    final file = await getFile;
    return file.writeAsString(score);
  }
}
