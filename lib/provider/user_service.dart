import 'package:image_galally/provider/user_repository.dart';

import 'data/user.dart';

class UserService {
  const UserService({
    required UserRepository repository,
  }) : _repository = repository;
  final UserRepository _repository;

  Future<List<User>> getUsersInfo() {
    return _repository.getUsersInfo();
  }
}
