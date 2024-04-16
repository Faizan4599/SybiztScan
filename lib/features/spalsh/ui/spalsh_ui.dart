import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sybizt_scan/features/scan/ui/scan_ui.dart';
import 'package:sybizt_scan/features/spalsh/bloc/splash_bloc.dart';

class SplashUi extends StatelessWidget {
  final SplashBloc bloc = SplashBloc();
  SplashUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.add(SplashUiNavigateToScanUiEvent());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: BlocConsumer<SplashBloc, SplashState>(
            bloc: bloc,
            buildWhen: (previous, current) => current is! SplashActionState,
            listenWhen: (previous, current) =>
                current is SplashActionState || current is SplashInitial,
            listener: (context, state) {
              // print("STATE......$state");
              if (state is SplashInitial) {
                Timer(
                  Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScanUi(),
                  )),
                );
              }
            },
            builder: (context, state) {
              // bloc.add(SplashUiNavigateToScanUiEvent());
              print("STATE ..... $state");
              return const Center(
                child: Text(
                  "Sybizt",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
