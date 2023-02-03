import '../models/search_food_item.dart';

abstract class BaseSearchRepository {
  Future<List<SearchItems>> search(String term);
}
