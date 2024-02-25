import 'package:book_store/src/core/logic/logic.dart';
import 'package:get_it/get_it.dart';

class RegisterSingletons {

  /// Create singletons
  static void registerSingletons() {
    GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());


  }

  /// Add syntax sugar for quickly accessing the logic
  static AppLogic get appLogic => GetIt.I.get<AppLogic>();
}