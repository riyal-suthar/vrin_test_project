class ApiEndPoints {
  static const kHostUrl = "https://namastestag.vrinsoft.in";
  static const kVersion = "/api/v1/";
  static const kBaseUrl = "$kHostUrl$kVersion";
  static const kSocketUrl = "ws://namaste.socket.vrinsoft.in:8020";

  // utils
  static const String kLabel = "labels";
  static const String kGeneralSettings = "general-settings";

  // authentication
  static const String kSignin = "signin";
  static const String kLogin = "login";
  static const String kLogout = "logout";
  static const String kForgotPassword = "forgot-password";
  static const String kResetPassword = "reset-password";
  static const String kDeleteAccount = "delete-account";
}
