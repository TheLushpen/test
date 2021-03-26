import 'package:gym_team/data/rest_client.dart';
import 'package:gym_team/domain/entry.dart';
import 'package:gym_team/domain/repository.dart';

class RestRepository implements Repository {
  final RestClient _restClient;

  RestRepository(this._restClient);

  @override
  Future<List<Entity>> getEntities() => _restClient.getEntries();
}
