import 'package:bloc_learning/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterCubit = CounterCubit();

  @override
  void dispose() {
    counterCubit.close(); // important
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter bloc')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          bloc: counterCubit,
          builder: (context, state) {
            return Text(state.toString(), style: const TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterCubit.increment,
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counterCubit.decrement,
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
