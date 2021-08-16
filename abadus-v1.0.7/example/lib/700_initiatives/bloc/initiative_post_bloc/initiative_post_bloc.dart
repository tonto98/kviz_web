import 'dart:async';

import 'package:abadus/abadus.dart';
import 'package:example/700_initiatives/models/models.dart';
import 'package:example/700_initiatives/resources/initiative_repository.dart';

class InitiativeUpdateBloc
    extends ApiRequestBloc<InitiativePost, InitiativePostSuccess> {
  @override
  Stream<InitiativePostSuccess> request(InitiativePost request) =>
      Stream.fromFuture(InitiativeRepository().updateInitiative(request, 15));
}

class InitiativeCreateBloc
    extends ApiRequestBloc<InitiativePost, InitiativePostSuccess> {
  @override
  Stream<InitiativePostSuccess> request(InitiativePost request) =>
      Stream.fromFuture(InitiativeRepository().createInitiative(request));
}
