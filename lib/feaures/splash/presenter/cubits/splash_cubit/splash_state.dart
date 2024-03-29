part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitialState extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoadingState extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoadedState extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashErrorState extends SplashState {
  final String message;

  const SplashErrorState(this.message);

  @override
  List<Object> get props => [message];
}
