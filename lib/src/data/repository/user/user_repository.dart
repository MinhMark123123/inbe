import 'package:inabe/src/data/repository/user/remote/user_retrofit_service.dart';

abstract class UserRepository{

}

class _UserRepositoryDefault extends UserRepository {
  final UserRetrofitService userRetrofitService;
  _UserRepositoryDefault({required this.userRetrofitService});
}