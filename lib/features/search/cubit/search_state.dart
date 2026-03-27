part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchSuccess extends SearchState {

  final List<Product> books;

  SearchSuccess(this.books);
}

final class SearchError extends SearchState {
  final String errorMassage;

  SearchError(this.errorMassage);
}
final class SearchLoading extends SearchState {}
