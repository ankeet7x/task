import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp/app/constants/api_endpoints.dart';
import 'package:taskapp/app/constants/app_constants.dart';
import 'package:taskapp/injector.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsAppBaseClient {
  Future getRequest(
      {String url = ApiEndPoints.usBusiness,
      String apiKey = '',
      bool shouldCache = false}) async {
    http.Response? response;
    try {
      apiKey = dotenv.get(AppConstants.apiKey);
      //http call
      response = await http.get(Uri.parse(url + apiKey));
      //conditional caching with bool value to cache only endpoints which is neccessary
      if (response.statusCode == 200 && shouldCache) {
        locator<SharedPreferences>().setString(url + apiKey, response.body);
      }
    } catch (e) {
      //on error return cache value if it is available
      final cacheValue = locator<SharedPreferences>().getString(url + apiKey);
      if (cacheValue != null) {
        response = http.Response(cacheValue, 200);
      }
    }
    return response;
  }
}
