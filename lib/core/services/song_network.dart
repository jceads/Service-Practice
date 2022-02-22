import 'package:http/http.dart' as http;

import 'model/song_model.dart';

class SongNetwork {
  static String url = "https://jsonplaceholder.typicode.com/photos";
  Future<List<SongModel>> fetchAllData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return usersFromJson(response.body);
    } else {
      throw Exception("Data gelmedi");
    }
  }
}
