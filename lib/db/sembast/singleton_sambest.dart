import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


class SingletonSembast {

  SingletonSembast._privateConstructor();

  Database db;
  static final SingletonSembast instance =
      SingletonSembast._privateConstructor();

  openDb() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);

    // File path to a file in the current directory
    var dbPath = join(dir.path, 'equiz_database.db');
    DatabaseFactory dbFactory = databaseFactoryIo;

// We use the database factory to open the database
    if (db == null) {
      db = await dbFactory.openDatabase(dbPath, version: 1);
    }
  }
}
