import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Logic
class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
  void reset() => state = 0;
}

// Provider
final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Counter')),
      body: Center(child: Text('Count: $count')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'inc',
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () => ref.read(counterProvider.notifier).reset(),
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
