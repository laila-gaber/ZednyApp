// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Halal`
  String get app_name {
    return Intl.message('Halal', name: 'app_name', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Choose your language`
  String get chooseYourLanguage {
    return Intl.message(
      'Choose your language',
      name: 'chooseYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Register as`
  String get registerAs {
    return Intl.message('Register as', name: 'registerAs', desc: '', args: []);
  }

  /// `Individual`
  String get individual {
    return Intl.message('Individual', name: 'individual', desc: '', args: []);
  }

  /// `Store`
  String get store {
    return Intl.message('Store', name: 'store', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Stores`
  String get stores {
    return Intl.message('Stores', name: 'stores', desc: '', args: []);
  }

  /// `Please login to access cart`
  String get pleaseLoginToAccessCart {
    return Intl.message(
      'Please login to access cart',
      name: 'pleaseLoginToAccessCart',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Cart Feature`
  String get cartFeature {
    return Intl.message(
      'Cart Feature',
      name: 'cartFeature',
      desc: '',
      args: [],
    );
  }

  /// `Error connecting to server`
  String get errorConnectserver {
    return Intl.message(
      'Error connecting to server',
      name: 'errorConnectserver',
      desc: '',
      args: [],
    );
  }

  /// `Contact admins`
  String get conatctAdmins {
    return Intl.message(
      'Contact admins',
      name: 'conatctAdmins',
      desc: '',
      args: [],
    );
  }

  /// `Network request error`
  String get networkRequestError {
    return Intl.message(
      'Network request error',
      name: 'networkRequestError',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get serverError {
    return Intl.message(
      'Server error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Bad response`
  String get badResponse {
    return Intl.message(
      'Bad response',
      name: 'badResponse',
      desc: '',
      args: [],
    );
  }

  /// `JSON parsing error`
  String get jsonParsingError {
    return Intl.message(
      'JSON parsing error',
      name: 'jsonParsingError',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Page cannot be reached`
  String get pageCantBeReached {
    return Intl.message(
      'Page cannot be reached',
      name: 'pageCantBeReached',
      desc: '',
      args: [],
    );
  }

  /// `This feature`
  String get thisFeature {
    return Intl.message(
      'This feature',
      name: 'thisFeature',
      desc: '',
      args: [],
    );
  }

  /// `Login required`
  String get loginRequired {
    return Intl.message(
      'Login required',
      name: 'loginRequired',
      desc: '',
      args: [],
    );
  }

  /// `requires login`
  String get requiresLogin {
    return Intl.message(
      'requires login',
      name: 'requiresLogin',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Later`
  String get later {
    return Intl.message('Later', name: 'later', desc: '', args: []);
  }

  /// `Error, try again`
  String get errorTryAgain {
    return Intl.message(
      'Error, try again',
      name: 'errorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `End of list`
  String get endOfList {
    return Intl.message('End of list', name: 'endOfList', desc: '', args: []);
  }

  /// `No data yet`
  String get noDataYet {
    return Intl.message('No data yet', name: 'noDataYet', desc: '', args: []);
  }

  /// `Login to continue feature`
  String get loginToContinueFeature {
    return Intl.message(
      'Login to continue feature',
      name: 'loginToContinueFeature',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Check internet connection`
  String get checkInternet {
    return Intl.message(
      'Check internet connection',
      name: 'checkInternet',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
