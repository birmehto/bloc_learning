import 'package:bloc_learning/counter_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CSeconPage extends StatelessWidget {
  const CSeconPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Mainus Plus")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment_fab',
            onPressed: () {
              counterBloc.add(CounterIncrement());
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement_fab',
            onPressed: () {
              counterBloc.add(CounterDecrement());
            },
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
