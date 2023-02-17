import 'package:inabe/src/data/api/retrofit_client.dart';

abstract class TopRepository {


}

class _TopRepositoryDefault extends TopRepository {
  final RestClient restClient;

  _TopRepositoryDefault({required this.restClient});
}
