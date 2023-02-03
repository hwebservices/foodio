import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodio/repositories/search_repo.dart';

import '../../models/search_food_item.dart';
import '../../models/serch_error.dart';

part 'food_event.dart';
part 'food_state.dart';

class SearchFoodBloc extends Bloc<SearchFoodEvent, SearchFoodState> {
  final SearchRepository _searchRepository;

  SearchFoodBloc({required SearchRepository searchRepository})
      : _searchRepository = searchRepository,
        super(SearchStateEmpty()) {
    on<TextChanged>(_onFoodLoaded);
  }

  Future<void> _onFoodLoaded(
      TextChanged event, Emitter<SearchFoodState> emit) async {
    final searchTerm = event.text;
    if (searchTerm.isEmpty) return emit(SearchStateEmpty());
    emit(SearchStateLoading());
    try {
      final items = await _searchRepository.search(searchTerm);
      // print(items);
      emit(SearchStateSuccess(items: items));
    } catch (error) {
      // print(error);
      emit(error is SearchResultError
          ? SearchStateError(error.message)
          : const SearchStateError('something went wrong'));
    }
  }
}
