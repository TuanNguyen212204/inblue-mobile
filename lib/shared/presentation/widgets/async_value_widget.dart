import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.data,
    super.key,
    this.loading,
    this.error,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget? loading;
  final Widget Function(Object error, StackTrace stack)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => loading ?? const Center(child: CircularProgressIndicator()),
      error: (e, st) =>
          error?.call(e, st) ??
          Center(child: Text('Đã xảy ra lỗi: $e')),
    );
  }
}
