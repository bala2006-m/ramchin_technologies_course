@JS()
library;

import 'package:js/js.dart';

@JS('Razorpay')
class Razorpay {
  external Razorpay(RazorpayOptions options);
  external void open();
  external void on(String event, Function callback);
}

@JS()
@anonymous
class RazorpayOptions {
  external String get key;
  external int get amount;
  external String get currency;
  external String get name;
  external String get description;
  external String? get image;
  external Prefill get prefill;

  external factory RazorpayOptions({
    String key,
    int amount,
    String currency,
    String name,
    String description,
    String? image,
    Prefill prefill,
  });
}

@JS()
@anonymous
class Prefill {
  external String get name;
  external String get email;
  external String get contact;

  external factory Prefill({String name, String email, String contact});
}
