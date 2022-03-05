import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp/app/constants/api_endpoints.dart';
import 'package:taskapp/injector.dart';

class NewsAppBaseClient {
  Future getRequest(
      {String baseUrl = ApiEndPoints.baseUrl,
      String path = '',
      bool showDialog = false,
      bool shouldCache = false}) async {
    http.Response? response;
    try {
      //http call
      response = await http.get(Uri.parse(baseUrl + path));
      //conditional caching with bool value to cache only endpoints which is neccessary
      if (response.statusCode == 200 && shouldCache) {
        locator<SharedPreferences>().setString(path, response.body);
      }
    } catch (e) {
      //on error return cache value if it is available
      final cacheValue = locator<SharedPreferences>().getString(path);
      if (cacheValue != null) {
        response = http.Response(cacheValue, 200);
      }
    }
    return response;
  }
}