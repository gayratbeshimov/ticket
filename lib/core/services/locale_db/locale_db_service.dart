// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:ticket/core/services/locale_db/user_db.dart';
//
// class LocaleDbService {
//   static LocaleDbService get to => Modular.get<LocaleDbService>();
//   late Isar isar;
//
//   static Future<LocaleDbService> init() async {
//     var instance = LocaleDbService();
//     final dir = await getApplicationSupportDirectory();
//     instance.isar = await Isar.open(
//       [UserDBSchema],
//       directory: dir.path,
//       name: 'localeDb',
//     );
//     return instance;
//   }
//
//   Future clearLocaleDb() async {
//     await isar.clear();
//   }
// }
