import 'dart:async';

import 'package:aztira/src/blocs/bloc_provider.dart';

class TaskBloc implements BlocBase {
  ///
  ///
  StreamController<int> _cmdController = StreamController<int>.broadcast();

  void dispose() {
    _cmdController.close();
  }
}
