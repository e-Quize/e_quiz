import 'package:e_quiz/db/repositiories/sembast_user_repository.dart';
import 'package:e_quiz/db/repositiories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


class Init {
  static Future initialize() async {
    _registerRepositories();
    await _initSembast();
  }

  static Future _initSembast() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = join(appDir.path, "sembast_equiz.db");
    final database = await databaseFactoryIo.openDatabase(databasePath);
    GetIt.I.registerSingleton<Database>(database);
  }

  static _registerRepositories() {
    GetIt.I
        .registerLazySingleton<UserRepository>(() => SembastUserRepository());
  }
}
