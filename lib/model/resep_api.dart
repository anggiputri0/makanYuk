import 'dart:convert';
import 'package:resepkuy/model/resep.dart';
import 'package:http/http.dart' as http;

class ResepApi {
  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "20", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "323fb44483mshd7dbe462abd5259p123769jsn22535c9de840",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['results']) {
      _temp.add(i);
    }
    return Resep.resepsFromSnapshot(_temp);
  }
}
