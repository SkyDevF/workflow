// TODO Implement this library.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import 'dart:math';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void add(String title) {
    state = [
      ...state,
      Todo(id: Random().nextInt(999999).toString(), title: title),
    ];
  }

  void toggle(String id) {
    state = state
        .map((todo) => todo.id == id
            ? todo.copyWith(isDone: !todo.isDone)
            : todo)
        .toList();
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(),
);