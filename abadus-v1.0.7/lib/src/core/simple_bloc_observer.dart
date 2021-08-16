import 'package:abadus/src/utility/log/log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
        String _ret =
            '''🔼 currentState => ${transition.currentState}\n⏩ nextState => ${transition.nextState}''';

        log.i(_ret);
    super.onTransition(bloc, transition);
  }
}