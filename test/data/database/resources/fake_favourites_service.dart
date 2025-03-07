import 'package:sembast/sembast_memory.dart';

class FakeFavouritesService {
  static final FakeFavouritesService _singleton =
      FakeFavouritesService._internal();
  factory FakeFavouritesService() => _singleton;
  FakeFavouritesService._internal();

  Database? _db;

  Future<Database> get db async {
    _db ??= await databaseFactoryMemory.openDatabase('test_db');
    return _db!;
  }
}
