import 'dart:typed_data';

import 'package:catapp/model/cat.dart';
import 'package:http/http.dart' as http;

class CatService {
  Future<Cat> fetchCat() async {
    final date = DateTime.now();
    final url = "https://cataas.com/cat/gif?${date.millisecondsSinceEpoch}";
    final response = await http.read(Uri.parse(url));
    return Cat(Uint8List.fromList(response.codeUnits), date);
  }
}
