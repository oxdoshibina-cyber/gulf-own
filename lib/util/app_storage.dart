import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;

class AppStorage {
static Future<void> setString(String key, String value) async {
  if (kIsWeb) {
    html.window.localStorage[key] = value;
    log("📌 LOCAL STORAGE SAVED: $key = ${html.window.localStorage[key]}");
  } else {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}

static Future<String?> getString(String key) async {
  if (kIsWeb) {
    final val = html.window.localStorage[key
    
    ];
    log("📌 LOCAL STORAGE READ: $key = $val");
    return val;
  } else {
    final prefs = await SharedPreferences.getInstance();
    final val = prefs.getString(key);
    log("📌 PREF READ: $key = $val");
    return val;
  }
}

  static Future<void> remove(String key) async {
    if (kIsWeb) {
      html.window.localStorage.remove(key);
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    }
  }

  static Future<void> clearAll() async {
    if (kIsWeb) {
      html.window.localStorage.clear();
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }
  }
}
