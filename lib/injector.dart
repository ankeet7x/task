import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp/core/network/base_client.dart';
import 'package:taskapp/features/news/repo/news_repo.dart';

final locator = GetIt.instance;

//Dependency injection
setupLocator() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);
  locator.registerFactory(() => NewsAppBaseClient());
  locator.registerFactory(() => NewsRepo(locator()));
}
