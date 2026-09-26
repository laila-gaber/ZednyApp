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

  /// `zedny`
  String get app_name {
    return Intl.message('zedny', name: 'app_name', desc: '', args: []);
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

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login successful!`
  String get loginSuccessful {
    return Intl.message(
      'Login successful!',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account to continue`
  String get loginToContinue {
    return Intl.message(
      'Login to your account to continue',
      name: 'loginToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `01234567890`
  String get phoneHint {
    return Intl.message('01234567890', name: 'phoneHint', desc: '', args: []);
  }

  /// `Phone is required`
  String get phoneIsRequired {
    return Intl.message(
      'Phone is required',
      name: 'phoneIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Please enter your phone number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be at least 11 digits`
  String get phoneAtLeast11Digits {
    return Intl.message(
      'Phone number must be at least 11 digits',
      name: 'phoneAtLeast11Digits',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Please enter your name`
  String get pleaseEnterName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter parent phone number`
  String get pleaseEnterParentPhone {
    return Intl.message(
      'Please enter parent phone number',
      name: 'pleaseEnterParentPhone',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register as a student to get started`
  String get registerAsStudentSubtitle {
    return Intl.message(
      'Register as a student to get started',
      name: 'registerAsStudentSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get nameIsRequired {
    return Intl.message(
      'Name is required',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Parent Phone Number`
  String get parentPhoneNumber {
    return Intl.message(
      'Parent Phone Number',
      name: 'parentPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Parent phone is required`
  String get parentPhoneIsRequired {
    return Intl.message(
      'Parent phone is required',
      name: 'parentPhoneIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Grade`
  String get grade {
    return Intl.message('Grade', name: 'grade', desc: '', args: []);
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone verified successfully!`
  String get phoneVerifiedSuccessfully {
    return Intl.message(
      'Phone verified successfully!',
      name: 'phoneVerifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOtp {
    return Intl.message('Verify OTP', name: 'verifyOtp', desc: '', args: []);
  }

  /// `We sent a code to`
  String get weSentCodeTo {
    return Intl.message(
      'We sent a code to',
      name: 'weSentCodeTo',
      desc: '',
      args: [],
    );
  }

  /// `Enter it below.`
  String get enterItBelow {
    return Intl.message(
      'Enter it below.',
      name: 'enterItBelow',
      desc: '',
      args: [],
    );
  }

  /// `Code expires in`
  String get codeExpiresIn {
    return Intl.message(
      'Code expires in',
      name: 'codeExpiresIn',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Please enter the OTP`
  String get pleaseEnterOtp {
    return Intl.message(
      'Please enter the OTP',
      name: 'pleaseEnterOtp',
      desc: '',
      args: [],
    );
  }

  /// `OTP must be 4 digits`
  String get otpMustBe4Digits {
    return Intl.message(
      'OTP must be 4 digits',
      name: 'otpMustBe4Digits',
      desc: '',
      args: [],
    );
  }

  /// `OTP resent to your phone`
  String get otpResent {
    return Intl.message(
      'OTP resent to your phone',
      name: 'otpResent',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Student`
  String get student {
    return Intl.message('Student', name: 'student', desc: '', args: []);
  }

  /// `Teacher`
  String get teacher {
    return Intl.message('Teacher', name: 'teacher', desc: '', args: []);
  }

  /// `Parent`
  String get parent {
    return Intl.message('Parent', name: 'parent', desc: '', args: []);
  }

  /// `User Type`
  String get userType {
    return Intl.message('User Type', name: 'userType', desc: '', args: []);
  }

  /// `Login as`
  String get loginAs {
    return Intl.message('Login as', name: 'loginAs', desc: '', args: []);
  }

  /// `Dashboard 👋`
  String get dashboard {
    return Intl.message('Dashboard 👋', name: 'dashboard', desc: '', args: []);
  }

  /// `Content`
  String get content {
    return Intl.message('Content', name: 'content', desc: '', args: []);
  }

  /// `Students`
  String get students {
    return Intl.message('Students', name: 'students', desc: '', args: []);
  }

  /// `Codes`
  String get codes {
    return Intl.message('Codes', name: 'codes', desc: '', args: []);
  }

  /// `Registered Students`
  String get registeredStudents {
    return Intl.message(
      'Registered Students',
      name: 'registeredStudents',
      desc: '',
      args: [],
    );
  }

  /// `Lectures`
  String get lectures {
    return Intl.message('Lectures', name: 'lectures', desc: '', args: []);
  }

  /// `Pending Warnings`
  String get pendingWarnings {
    return Intl.message(
      'Pending Warnings',
      name: 'pendingWarnings',
      desc: '',
      args: [],
    );
  }

  /// `Chapters`
  String get chapters {
    return Intl.message('Chapters', name: 'chapters', desc: '', args: []);
  }

  /// `+ Add Chapter`
  String get addChapter {
    return Intl.message(
      '+ Add Chapter',
      name: 'addChapter',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Generate Codes`
  String get generateCodes {
    return Intl.message(
      'Generate Codes',
      name: 'generateCodes',
      desc: '',
      args: [],
    );
  }

  /// `Create subscription codes for students`
  String get generateCodesSubtitle {
    return Intl.message(
      'Create subscription codes for students',
      name: 'generateCodesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Code Type`
  String get codeType {
    return Intl.message('Code Type', name: 'codeType', desc: '', args: []);
  }

  /// `Lecture`
  String get lecture {
    return Intl.message('Lecture', name: 'lecture', desc: '', args: []);
  }

  /// `Book`
  String get book {
    return Intl.message('Book', name: 'book', desc: '', args: []);
  }

  /// `Revision`
  String get revision {
    return Intl.message('Revision', name: 'revision', desc: '', args: []);
  }

  /// `Select Lecture`
  String get selectLecture {
    return Intl.message(
      'Select Lecture',
      name: 'selectLecture',
      desc: '',
      args: [],
    );
  }

  /// `Select a lecture...`
  String get selectLectureHint {
    return Intl.message(
      'Select a lecture...',
      name: 'selectLectureHint',
      desc: '',
      args: [],
    );
  }

  /// `Number of Codes`
  String get numberOfCodes {
    return Intl.message(
      'Number of Codes',
      name: 'numberOfCodes',
      desc: '',
      args: [],
    );
  }

  /// `Search for a student...`
  String get searchStudent {
    return Intl.message(
      'Search for a student...',
      name: 'searchStudent',
      desc: '',
      args: [],
    );
  }

  /// `5 registered students`
  String get registeredCount {
    return Intl.message(
      '5 registered students',
      name: 'registeredCount',
      desc: '',
      args: [],
    );
  }

  /// `Blocked`
  String get blocked {
    return Intl.message('Blocked', name: 'blocked', desc: '', args: []);
  }

  /// `Warnings`
  String get warnings {
    return Intl.message('Warnings', name: 'warnings', desc: '', args: []);
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Teacher Mohamed`
  String get teacherName {
    return Intl.message(
      'Teacher Mohamed',
      name: 'teacherName',
      desc: '',
      args: [],
    );
  }

  /// `lecture added successfully!`
  String get codesGeneratedSuccess {
    return Intl.message(
      'lecture added successfully!',
      name: 'codesGeneratedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Chapter added successfully!`
  String get chapterAddedSuccess {
    return Intl.message(
      'Chapter added successfully!',
      name: 'chapterAddedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Students List`
  String get studentsList {
    return Intl.message(
      'Students List',
      name: 'studentsList',
      desc: '',
      args: [],
    );
  }

  /// `Search by name, phone, or parent phone...`
  String get searchStudentHint {
    return Intl.message(
      'Search by name, phone, or parent phone...',
      name: 'searchStudentHint',
      desc: '',
      args: [],
    );
  }

  /// `Total Students`
  String get totalStudents {
    return Intl.message(
      'Total Students',
      name: 'totalStudents',
      desc: '',
      args: [],
    );
  }

  /// `Student Details`
  String get studentDetails {
    return Intl.message(
      'Student Details',
      name: 'studentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Parent Phone`
  String get parentPhone {
    return Intl.message(
      'Parent Phone',
      name: 'parentPhone',
      desc: '',
      args: [],
    );
  }

  /// `No students found`
  String get noStudentsFound {
    return Intl.message(
      'No students found',
      name: 'noStudentsFound',
      desc: '',
      args: [],
    );
  }

  /// `Failed to fetch students`
  String get failedToFetchStudents {
    return Intl.message(
      'Failed to fetch students',
      name: 'failedToFetchStudents',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message('Call', name: 'call', desc: '', args: []);
  }

  /// `Copy Phone`
  String get copyPhone {
    return Intl.message('Copy Phone', name: 'copyPhone', desc: '', args: []);
  }

  /// `Phone number copied!`
  String get phoneCopied {
    return Intl.message(
      'Phone number copied!',
      name: 'phoneCopied',
      desc: '',
      args: [],
    );
  }

  /// `Add New Chapter`
  String get addChapterTitle {
    return Intl.message(
      'Add New Chapter',
      name: 'addChapterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chapter Name`
  String get chapterName {
    return Intl.message(
      'Chapter Name',
      name: 'chapterName',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get chapterDescription {
    return Intl.message(
      'Description',
      name: 'chapterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Chapter Order`
  String get chapterOrder {
    return Intl.message(
      'Chapter Order',
      name: 'chapterOrder',
      desc: '',
      args: [],
    );
  }

  /// `Add New Lecture`
  String get addLectureTitle {
    return Intl.message(
      'Add New Lecture',
      name: 'addLectureTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lecture Name`
  String get lectureName {
    return Intl.message(
      'Lecture Name',
      name: 'lectureName',
      desc: '',
      args: [],
    );
  }

  /// `Lecture Description`
  String get lectureDescription {
    return Intl.message(
      'Lecture Description',
      name: 'lectureDescription',
      desc: '',
      args: [],
    );
  }

  /// `Video URL`
  String get videoUrl {
    return Intl.message('Video URL', name: 'videoUrl', desc: '', args: []);
  }

  /// `Lecture Order`
  String get lectureOrder {
    return Intl.message(
      'Lecture Order',
      name: 'lectureOrder',
      desc: '',
      args: [],
    );
  }

  /// `Upload Thumbnail`
  String get uploadThumbnail {
    return Intl.message(
      'Upload Thumbnail',
      name: 'uploadThumbnail',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `No chapters found for this grade`
  String get noChaptersFound {
    return Intl.message(
      'No chapters found for this grade',
      name: 'noChaptersFound',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Teacher`
  String get welcomeTeacher {
    return Intl.message(
      'Welcome Teacher',
      name: 'welcomeTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Student`
  String get welcomeStudent {
    return Intl.message(
      'Welcome Student',
      name: 'welcomeStudent',
      desc: '',
      args: [],
    );
  }

  /// `Lecture Details`
  String get lectureDetails {
    return Intl.message(
      'Lecture Details',
      name: 'lectureDetails',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load lecture details`
  String get failedToLoadLecture {
    return Intl.message(
      'Failed to load lecture details',
      name: 'failedToLoadLecture',
      desc: '',
      args: [],
    );
  }

  /// `Video URL not available`
  String get videoNotAvailable {
    return Intl.message(
      'Video URL not available',
      name: 'videoNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Select Video`
  String get selectVideo {
    return Intl.message(
      'Select Video',
      name: 'selectVideo',
      desc: '',
      args: [],
    );
  }

  /// `Video Selected`
  String get videoSelected {
    return Intl.message(
      'Video Selected',
      name: 'videoSelected',
      desc: '',
      args: [],
    );
  }

  /// `Select Cover Image`
  String get selectImage {
    return Intl.message(
      'Select Cover Image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Image Selected`
  String get imageSelected {
    return Intl.message(
      'Image Selected',
      name: 'imageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get confirmLogout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
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
