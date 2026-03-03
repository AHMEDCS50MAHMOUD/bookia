part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class GetHomeSlidersError extends HomeState {}
final class GetHomeSlidersSuccess extends HomeState {
 final List<SliderImages>Sliders;

  GetHomeSlidersSuccess(this.Sliders);
}
final class GetHomeSlidersLoading extends HomeState {}
