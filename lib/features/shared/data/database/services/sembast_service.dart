import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

abstract class Singleton {
  Singleton._privateConstructor();
}

class SembastService extends Singleton {
  SembastService._privateConstructor() : super._privateConstructor();

  static final SembastService _instance = SembastService._privateConstructor();

  factory SembastService() => _instance;

  Database? _db;

  Future<Database> get db async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, dotenv.env['DATABASE_NAME']);
    _db = await databaseFactoryIo.openDatabase(path);
    return _db!;
  }
}
