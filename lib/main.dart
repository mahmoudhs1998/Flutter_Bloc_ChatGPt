import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit/cubit.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => CounterCubit(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Counter App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CounterDisplay(),
                SizedBox(height: 20),
                IncrementButton(),
                SizedBox(height: 10),
                DecrementButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
        return Text(
          '$state',
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
      child: const Text('Increment'),
    );
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(),
      child: const Text('Decrement'),
    );
  }
}