import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodio/bloc/food/food_bloc.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _SearchBar(),
        _SearchBody(),
      ],
    );
  }
}

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();
  late SearchFoodBloc _searchFoodBloc;

  @override
  void initState() {
    super.initState();
    _searchFoodBloc = context.read<SearchFoodBloc>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          color: Theme.of(context).primaryColorLight,
        ),
        child: TextField(
          controller: _textController,
          autocorrect: false,
          onChanged: (text) {
            _searchFoodBloc.add(TextChanged(text: text));
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: GestureDetector(
                onTap: _onClearTapped,
                child: const Icon(Icons.clear),
              ),
              border: InputBorder.none,
              hintText: 'Enter a search term'),
        ),
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _searchFoodBloc.add(const TextChanged(text: ''));
  }
}

class _SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFoodBloc, SearchFoodState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          var food = state.items;
          return state.items.isEmpty
              ? const Text('No Results')
              : Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Image.network(
                              food[index].photo!.thumb == null
                                  ? ""
                                  : food[index].photo!.thumb.toString()),
                          title: Text(food[index].foodName.toString()),
                        ),
                      );
                    },
                  ),
                );
        }
        return const Text('');
      },
    );
  }
}
