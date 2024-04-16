import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitial()) {
    on<GetScanCodeEvent>(getScanCodeEvent);
  }

  FutureOr<void> getScanCodeEvent(
      GetScanCodeEvent event, Emitter<ScanState> emit) async {
    scanQRCode();
  }

  Future<void> scanQRCode() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      emit(ScanSuccessState());
      // Do something with the scanned QR code
      print(">>>>>>>>>>>>>>>>>>>>>");
      print("Scanned QR code Type: ${barcode.type}");
      print("Scanned QR code RaW content: ${barcode.rawContent}");
      print("Scanned QR code RaW format: ${barcode.format}");
      print("Scanned QR code RaW format Note: ${barcode.formatNote}");
      String rawContent = barcode.rawContent;
      int startIndex = rawContent.indexOf("S/N ID:") +
          7; // Index of "S/N ID:" + length of "S/N ID:"
      int endIndex = rawContent.indexOf("WO#");
      String id = rawContent.substring(startIndex, endIndex).trim();
      // Print the extracted ID
      print("Scanned QR code ID: $id");
      await sendIdToDesktop(id);
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
    }
  }

  Future<void> sendIdToDesktop(String id) async {
    print("IN SIDE DESKTOP FUNC");
    try {
      Socket socket = await Socket.connect('10.14.14.206', 3000);
      print("Connected to desktop server");
      print("SOCKET PARA $socket");

      // Send id to desktop server
      socket.write(id);

      // Close the connection after sending data
      await socket.close();
    } catch (error) {
      print("Error connecting to desktop server: $error");
    }
  }
}
