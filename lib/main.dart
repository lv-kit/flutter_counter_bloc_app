import 'package:flutter/material.dart';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter_counter_block_app/counter_block.dart';

void main() => runApp(
  BlocProvider<CounterBloc>(
      child: App(),
      creator: (context, _bag) => CounterBloc())
);

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return MaterialApp(
      home: Scaffold(
        body: _body(bloc),
        floatingActionButton: _floatingActionButton(bloc),
      ),
    );
  }

  Widget _body(bloc) {
    return Center(
      child: StreamBuilder<int>(
        stream: bloc.count,
        initialData: bloc.count.value,
        builder: (context, snap) => Text(
          'count: ${snap.data}',
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }

  Widget _floatingActionButton(bloc) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => bloc.increment.add(null)
    );
  }
}
