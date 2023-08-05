import 'package:isar/isar.dart';

part 'user_db.g.dart';

@collection
class UserDB {
  Id? id;
  String? apiId;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phone;
  String? login;
  String? agentType;
  String? apkVersion;
  DateTime? lastSync;
  String? color;
  String? code;
  String? fullName;
  String? token;
  String? refreshToken;
  DateTime? expireTime;
  String? serverName;

}
