import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom `BlocObserver` implementation that logs state changes and errors
/// for all BLoC instances in the application.
///
/// Example usage:
/// ```dart
/// void main() {
///   Bloc.observer = const SCBlocLogger();
///   runApp(MyApp());
/// }
/// ```
class SCBlocLogger extends BlocObserver {
  const SCBlocLogger();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, ${change.nextState})');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
