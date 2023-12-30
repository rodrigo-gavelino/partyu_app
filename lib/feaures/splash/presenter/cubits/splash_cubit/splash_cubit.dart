import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  Future<void> loadSplash() async {
    emit(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashLoadedState());
  }
}
