import 'package:flutter/material.dart';

typedef NavigatorKey = GlobalKey<NavigatorState>;

abstract mixin class NavigationService {
  static final NavigatorKey navigatorKey = NavigatorKey();

  final NavigatorState? _key = navigatorKey.currentState;

  bool? canPop() => _key?.canPop();

  Future<void> pop([Object? result]) async => _key?.pop(result);

  Future<void> popUntil(String routeName) async =>
      _key?.popUntil(ModalRoute.withName(routeName));

  Future<void> push(String routeName, {Object? arguments}) async =>
      await _key?.pushNamed(routeName, arguments: arguments);

  Future<void> pushReplacement(String routeName, {Object? arguments}) async =>
      await _key?.pushReplacementNamed(routeName, arguments: arguments);

  Future<void> pushAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) async =>
      await _key?.pushNamedAndRemoveUntil(
        routeName,
        predicate,
        arguments: arguments,
      );

  Future<void> popAndPush(String routeName, {Object? arguments}) async =>
      await _key?.popAndPushNamed(routeName, arguments: arguments);
}
