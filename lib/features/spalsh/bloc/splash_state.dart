part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

abstract class SplashActionState extends SplashState {}

final class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashErrorState extends SplashState {}

class SplashNavigateToScanUiState extends SplashState {}
