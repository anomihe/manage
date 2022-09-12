import 'package:isar/isar.dart';
import 'package:manage/models/isar.dart';

class ManageServices {
  late Future<Isar> db;

  ManageServices() {
    db = openDb();
  }

  Future<void> saveProducts(Managed manage) async {
    final isar = await db;
    isar.writeTxnSync<int>((isar) => isar.manageds.putSync(manage));
  }

  Future<void> clearManaged() async {
    final isar = await db; 
    await isar.writeTxn((isar) => isar.clear()); 
  }

  Future<List<Managed>> getProducts(Managed manage) async {
    final isar = await db;
    return await isar.manageds.where().findAll();
  }

  Stream<List<Managed>> listenToAdd() async* {
    final isar = await db;
    yield* isar.manageds.where().watch(initialReturn: true);
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        schemas: [ManagedSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
