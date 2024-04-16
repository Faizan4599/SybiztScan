import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashUiNavigateToScanUiEvent>(splashUiNavigateToScanUiEvent);
  }

  FutureOr<void> splashUiNavigateToScanUiEvent(
      SplashUiNavigateToScanUiEvent event, Emitter<SplashState> emit) async {
        // print("SSSSSSss");
    emit(SplashInitial());
    
  }
}
