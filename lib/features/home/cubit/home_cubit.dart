import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/home/data/models/slider_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getHomeData()async{
  await Future.wait([
   getSlider(),
    getBestSellerBooks()
  ]);
  }

 Future<void> getSlider()async{
    emit(GetHomeSlidersLoading());
    final response=await HomeRepo.getHomeSliders();
if(response is SliderModel){
  emit(GetHomeSlidersSuccess(
    response.data?.sliders??[]
  ));
}else{
  emit(GetHomeSlidersError());
}
  }

  Future<void>  getBestSellerBooks()async {
    emit(GetBestSellerLoading());
    final response=await HomeRepo.getBestSellerBooks();
    if(response is BooksModel){
      emit(GetBestSellerSuccess(
        response.data?.products??[]
      ));
    }else{
      emit(GetBestSellerError());
    }
  }
}
