part of 'food_bloc.dart';

abstract class SearchFoodState extends Equatable {
  const SearchFoodState();

  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends SearchFoodState {}

class SearchStateLoading extends SearchFoodState {}

class SearchStateSuccess extends SearchFoodState {
  const SearchStateSuccess({required this.items});

  final List<SearchItems> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends SearchFoodState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
