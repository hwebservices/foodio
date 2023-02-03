import 'dart:async';
import 'dart:convert';
import 'package:foodio/models/search_food_item.dart';
import 'package:foodio/repositories/base_search_client.dart';
import 'package:http/http.dart' as http;

import '../models/serch_error.dart';

class SearchRepository extends BaseSearchRepository {
  @override
  Future<List<SearchItems>> search(String term) async {
    var baseUrl = 'https://trackapi.nutritionix.com/v2/search/instant?query=';
    var headers = {
      "x-app-id": "6dbcfb7e",
      "x-app-key": "2a39c9911bc3640773cd4578e62e98ac",
    };
    final response =
        await http.get(Uri.parse("$baseUrl$term"), headers: headers);
    final results = jsonDecode(response.body)["common"];
    if (response.statusCode == 200) {
      var parsed = results.cast<Map<String, dynamic>>();
      // print(parsed);
      return parsed
          .map<SearchItems>((json) => SearchItems.fromJson(json))
          .toList();
    } else {
      throw jsonDecode(response.body)["message"];
    }
  }
}
