import 'package:gym_team/domain/entry.dart';

abstract class Repository {
  Future<List<Entity>> getEntities();
}
