import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Timer? _debounce;

  void searchAction(String text) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (text.isNotEmpty) {
        search(text);
      } else {
        emit(SearchInitial());
      }
    });
  }

  Future<void> search(String text) async {
    emit(SearchLoading());
    final response = await SearchRepo.search(text);
    if (response is BooksModel) {
      if (response.data?.products?.isEmpty ?? true) {
        emit(SearchError("No Books Found"));
      } else {
        emit(SearchSuccess(response.data?.products ?? []));
      }
    } else {
      emit(SearchError(response.toString()));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
