import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_list.freezed.dart';
part 'paged_list.g.dart';

@Freezed(genericArgumentFactories: true)
class PagedList<T> with _$PagedList<T> {
  const factory PagedList({
    required List<T> items,
    required int currentPage,
    required int totalPages,
    required int totalItems,
    required int pageSize,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) = _PagedList<T>;

  factory PagedList.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PagedListFromJson(json, fromJsonT);
}

extension PagedListExtension<T> on PagedList<T> {
  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
  int get length => items.length;
  
  PagedList<T> copyWithNewItems(List<T> newItems) {
    return copyWith(items: [...items, ...newItems]);
  }
  
  PagedList<U> map<U>(U Function(T) mapper) {
    return PagedList<U>(
      items: items.map(mapper).toList(),
      currentPage: currentPage,
      totalPages: totalPages,
      totalItems: totalItems,
      pageSize: pageSize,
      hasNextPage: hasNextPage,
      hasPreviousPage: hasPreviousPage,
    );
  }
}