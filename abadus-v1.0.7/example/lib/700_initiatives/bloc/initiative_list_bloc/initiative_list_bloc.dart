import 'dart:async';

import 'package:abadus/abadus.dart';
import 'package:example/700_initiatives/models/models.dart';
import 'package:example/700_initiatives/resources/initiative_repository.dart';

class InitiativeListAllBloc extends ApiPaginationRequestBloc<Null, Initiative> {
  @override
  Stream<PaginationModel<Initiative>> request(
          Null request, state, String nextPageUrl) =>
      InitiativeRepository().getInitiativeList(nextPageUrl: nextPageUrl);
}
