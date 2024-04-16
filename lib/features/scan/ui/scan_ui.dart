import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sybizt_scan/features/scan/bloc/scan_bloc.dart';

class ScanUi extends StatelessWidget {
  ScanUi({Key? key}) : super(key: key);
  final ScanBloc bloc = ScanBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Product"),
      ),
      body: BlocBuilder<ScanBloc, ScanState>(
        bloc: bloc,
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                bloc.add(GetScanCodeEvent());
              },
              child: const Text("Scan"),
            ),
          );
        },
      ),
    );
  }
}
