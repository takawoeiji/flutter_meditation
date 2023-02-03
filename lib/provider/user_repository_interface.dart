import 'package:image_galally/provider/data/user.dart';

/// 引数が必要な場合は別途入れます。
abstract class UserRepositoryInterface {
  Future<List<User>> getUsersInfo();
}
