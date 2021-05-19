import 'package:url_launcher/url_launcher.dart';

class MessagingService {
  void call(String number) => launch('tel:$number');
  void email(String email) => launch('mailto:$email');
  void browser(String url) => launch(
        '$url',
        //forceWebView: true,
        //enableJavaScript: true,
      );
}
