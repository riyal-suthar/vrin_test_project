import 'package:ticket_reselling/export.dart';

class ColorConst {
  static const kPrimaryColor = Color(0xFFF89939);
  static const kSecondaryColor = Color(0xFF9AD7D4);
  static const kBorderColor = Color(0xFF6D6D6D);
  static const kDisableColor = Color(0xFF6D6D6D);

  static const kWhiteColor = Color(0xFFFFFFFF);
  static const kBlackColor = Color(0xFF000000);
  static const kGray100Color = Color(0xFFC7C7C7);
  static const kGray200Color = Color(0xFF6D6D6D);

  static const kDarkBlueColor = Color(0xFF0B1520);
  static const kRedColor = Color(0xFFD72929);
}

/// Color convertor
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension MaterialCode on Color {
  MaterialColor toMaterialColor() {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final r = red, g = green, b = blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }
}
