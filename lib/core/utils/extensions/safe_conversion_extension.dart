import 'dart:convert';

String safeString(dynamic value, [String defaultValue = '']) {
  if (value == null) return defaultValue;
  if (value is String) {
    return value == '' ? defaultValue : value;
  } else if (value is int) {
    return value.toString();
  } else if (value is double) {
    final parsed = value.toInt().toString();
    return parsed;
  } else {
    return defaultValue;
  }
}

double safeDouble(dynamic value, [double defaultValue = 0.0]) {
  if (value == null) return defaultValue;
  if (value is double) {
    final formatted = value.toString();
    final cleaned = formatted.endsWith('.0') ? double.parse(formatted.substring(0, formatted.length - 2)) : value;
    return cleaned;
  } else if (value is int) {
    return value.roundToDouble();
  } else if (value is String) {
    final parsed = double.tryParse(value);
    return parsed ?? defaultValue;
  } else {
    return defaultValue;
  }
}

int safeInt(dynamic value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  if (value is int) {
    return value;
  } else if (value is double) {
    return value.toInt();
  } else if (value is String) {
    return int.tryParse(value) ?? defaultValue;
  } else {
    return defaultValue;
  }
}

bool safeBool(dynamic value, [bool defaultValue = false]) {
  if (value == null) return defaultValue;
  if (value is bool) {
    return value;
  } else if (value is int) {
    return value == 0 ? false : true;
  } else if (value is double) {
    value = value.toInt();
    return value == 0 ? false : true;
  } else if (value is String) {
    if (value.contains("true") || value.contains("false")) {
      return value.contains("true");
    } else {
      value = int.tryParse(value) ?? defaultValue;
      return value == 0 ? false : true;
    }
  } else {
    return defaultValue;
  }
}

String formatDouble(double value) {
  final formatted = value.toString();
  final cleaned = formatted.endsWith('.0') ? formatted.substring(0, formatted.length - 2) : formatted;
  return cleaned;
}

extension DoubleCustomExtenstion on double {
  double roundCustom({int decimalPlaces = 2}) {
    return double.parse(toStringAsFixed(decimalPlaces));
  }
}

String? safeHomeTown(dynamic homeTown) {
  try {
    if (homeTown is String && homeTown.startsWith('{') && homeTown.endsWith('}')) {
      final parsedJson = json.decode(homeTown);
      return parsedJson['home_location'] ?? homeTown;
    } else {
      return homeTown;
    }
  } catch (e) {
    return homeTown.toString();
  }
}
