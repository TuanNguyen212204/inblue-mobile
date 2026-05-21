import 'package:equatable/equatable.dart';

class PaginatedList<T> extends Equatable {
  const PaginatedList({
    required this.items,
    required this.page,
    required this.hasMore,
  });

  final List<T> items;
  final int page;
  final bool hasMore;

  @override
  List<Object?> get props => [items, page, hasMore];
}
