import 'localization.dart';

class LocalizationEN implements Localization {

  @override
  String get loginTitle => "Login";

  @override
  String get internetNotConnected => "Internet not connected";

  @override
  String get email => "Email";

  @override
  String get forgotPassword => "Forgot password?";

  @override
  String get password => "Password";

  @override
  String get msgEnterAddress => "Please enter a email address";

  @override
  String get msgEnterValidAddress => "Invalid! Enter a valid email address.";

  @override
  String get msgValidAddress => "Valid email address.";

  @override
  String get signIn => "Don't have an account? ";

  @override
  String get signInTitle => "Sign In";

  @override
  String get msgEnterName => "Please enter a name";

  @override
  String get name => "Name";

  @override
  String get confirmPassword => "Confirmed Password";

  @override
  String get mobile => "Mobile Number";

  @override
  String get msgEnterMobile => "Please enter a mobile";

  @override
  String get alertPermissionNotRestricted =>
      "Please grant permission from settings for access feature";

  @override
  String get appName => "Base Project";

  @override
  String get cancel => "Cancel";

  @override
  String get ok => "Ok";

  @override
  String get errorConfirmPassword => "Confirm password not matched";

  @override
  String get errorDiffPassword => "Confirm password not matched";

  @override
  String get errorPassword => "errorPassword";

  @override
  String get errorValidMobileNumber => "errorValidMobileNumber";

  @override
  String get errorValidPassword => "errorValidPassword";
}
