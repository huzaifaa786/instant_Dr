import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/values/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StripeApi {
  static paymentIntent(price) async {
    var url = BASE_URL + 'payment/intent';
    var data = {'price': price};
    var response = await Api.execute(url: url, data: data);
    print(response);

    return response['intent'];
  }


 

}
