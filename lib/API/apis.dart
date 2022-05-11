import 'dart:convert';
import 'package:http/http.dart';
import 'api_model.dart';

class HttpServices {
  Future<List<dynamic>> getTrending(String listType) async {
    Response response = await get(Uri.parse(listType));
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);

      print(decodedJson);
      List<dynamic> list = decodedJson['results']
          .map((item) => Trending.fromJson(item))
          .toList();

      return list;
    } else {
      throw 'Couldn\t get list';
    }
  }
}
