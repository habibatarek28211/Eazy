import 'package:eazy/core/utils/lang.dart';
import 'package:eazy/l10n/app_localizations.dart';
import 'package:flutter/material.dart';


extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension AppSize on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  bool get isPhone => MediaQuery.sizeOf(this).width < 600;
}

// extension FirstNameExtractor on String {
  /// Extracts the first name from a full name string.
//   String get extractFirstName {
//     return split(' ').first;
//   }
// }

// extension GetTheme on BuildContext {
//   ThemeData get theme => Theme.of(this);
//   bool get isDarkMode => theme.brightness == Brightness.dark;
// }

// extension Regex on String {
//   bool get isEmailValid => RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);

//   bool get isPasswordValid => RegExp(r"^.{8,}$").hasMatch(this);
// }

extension Language on BuildContext {
  AppLocalizations get lang => Lang.instance;
}