import 'package:bloc_learning/counter_app/bloc/counter_bloc.dart';
import 'package:bloc_learning/counter_app/cubit/counter_cubit.dart';
import 'package:bloc_learning/counter_app/home/secon_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    print("Buil");
    return Scaffold(
      appBar: AppBar(title: const Text('Counter bloc')),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(state.toString(), style: const TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'Sec',
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SeconPage()));
            },
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
