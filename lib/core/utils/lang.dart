import 'package:eazy/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Lang {
  static late AppLocalizations instance;
  static load() async {
    instance = await AppLocalizations.delegate.load(const Locale('ar'));

    // final languageCode = PlatformDispatcher.instance.locales.first.languageCode;

    // if (languageCode.contains('ar')) {
    //   instance = await AppLocalizations.delegate.load(const Locale('ar'));
    // } else {
    //   instance = await AppLocalizations.delegate.load(const Locale('en'));
    // }
  }

  Future<void> changeLang(String code) async {
    await Future.microtask(() async {
      instance = await AppLocalizations.delegate.load(Locale(code));
    });
  }
}
