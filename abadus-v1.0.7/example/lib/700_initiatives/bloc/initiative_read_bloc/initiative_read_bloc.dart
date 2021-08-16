import 'dart:async';

import 'package:abadus/abadus.dart';
import 'package:example/700_initiatives/models/initiative_read_success.dart';
import 'package:example/700_initiatives/resources/initiative_repository.dart';

class InitiativeReadBloc extends ApiRequestBloc<int, InitiativeReadSuccess> {
  @override
  Stream<InitiativeReadSuccess> request(int request) {
    return InitiativeRepository().getInitiative(request, cache: true);
  }
}
