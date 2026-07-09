import 'package:url_launcher/url_launcher.dart';

Future<void> downloadCv() async {
  await launchUrl(Uri.parse(
    'https://raw.githubusercontent.com/mahmoudfahmy616572/My_protfolio/gh-pages/assets/assets/pdfs/Mahmoud%20Fahmy_CV.pdf',
  ));
}
