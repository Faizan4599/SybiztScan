import 'dart:async';
import 'dart:convert'; // Import 'dart:convert' for the 'utf8' codec

import 'dart:io';
import 'dart:typed_data';

void main() {
  ServerSocket.bind('10.14.14.206', 3000).then((ServerSocket server) {
    print('Server is listening on ${server.address}:${server.port}');
    server.listen((Socket client) {
      client.transform(utf8.decoder as StreamTransformer<Uint8List, dynamic>).listen((dynamic data) {
        // Handle data received
        if (data is String) {
          print('Received ID: $data');
          // Write data to a file
          File('ids.txt').writeAsString(data);
        }
      });
    });
  });
}
