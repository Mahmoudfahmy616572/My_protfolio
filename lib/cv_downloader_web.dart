import 'dart:html' show Blob, Url, AnchorElement;
import 'package:flutter/services.dart' show rootBundle;

Future<void> downloadCv() async {
  final data = await rootBundle.load('assets/pdfs/Mahmoud Fahmy.pdf');
  final blob = Blob([data.buffer.asUint8List()]);
  final url = Url.createObjectUrlFromBlob(blob);
  AnchorElement(href: url)
    ..target = '_blank'
    ..download = 'Mahmoud_Fahmy.pdf'
    ..click();
  Url.revokeObjectUrl(url);
}
