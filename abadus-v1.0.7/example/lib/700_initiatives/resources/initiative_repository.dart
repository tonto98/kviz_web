import 'package:abadus/abadus.dart';
import 'package:example/700_initiatives/models/models.dart';
import 'package:example/700_initiatives/resources/initiative_api_provider.dart';

class InitiativeRepository {
  InitiativeApiProvider _initiativeApi = InitiativeApiProvider();

  Stream<PaginationModel<Initiative>> getInitiativeList({String nextPageUrl}) {
    if (nextPageUrl == null) {
      return _initiativeApi.getInitiativeListWithCache();
    } else {
      return Stream.fromFuture(_initiativeApi.getInitiativeList(nextPageUrl));
    }
  }

  Future<InitiativePostSuccess> updateInitiative(
      InitiativePost initiative, int id) {
    return _initiativeApi.updateInitiative(initiative, id);
  }

  Future<InitiativePostSuccess> createInitiative(InitiativePost initiative) {
    return _initiativeApi.createInitiative(initiative);
  }

  Stream<InitiativeReadSuccess> getInitiative(int id, {bool cache = true}) {
    if (!cache) {
      return Stream.fromFuture(_initiativeApi.getInitiativeNoCache(id));
    }
    return _initiativeApi.getInitiative(id);
  }
}
