part of 'food_bloc.dart';

abstract class SearchFoodEvent extends Equatable {
  const SearchFoodEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends SearchFoodEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
