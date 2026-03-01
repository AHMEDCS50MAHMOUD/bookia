import 'package:bloc/bloc.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());



  void login({required String email,required String password})async{
    emit(AuthLoadingState());
final response=await AuthRepo.login(email: email, password: password);
  if(response){
    emit(AuthSuccessState());
  }else{}
    emit(AuthErrorState());
  }

}
