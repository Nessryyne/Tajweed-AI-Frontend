import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationManager {
  static final LocalizationManager _instance = LocalizationManager._internal();
  factory LocalizationManager() => _instance;
  LocalizationManager._internal();

  static LocalizationManager get instance => _instance;

  // SharedPreferences keys
  static const String _languageCodeKey = 'selected_language_code';
  static const String _countryCodeKey = 'selected_country_code';

  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('ar', 'SA'),
  ];

  // Get current locale - will be set by context
  Locale _currentLocale = const Locale('en', 'US');

  // Get current locale
  Locale get currentLocale => _currentLocale;

  // Get current language code
  String get currentLanguageCode => currentLocale.languageCode;

  // Get current country code
  String get currentCountryCode => currentLocale.countryCode ?? '';

  // Check if current language is RTL
  bool get isRTL => currentLanguageCode == 'ar';

  // Set current locale
  void setCurrentLocale(Locale locale) {
    _currentLocale = locale;
  }

  // Change language and save to preferences
  Future<void> changeLanguage(
    String languageCode,
    String countryCode,
    BuildContext context,
  ) async {
    final easyLocalization = EasyLocalization.of(context);
    if (easyLocalization != null) {
      await easyLocalization.setLocale(Locale(languageCode, countryCode));
      _currentLocale = Locale(languageCode, countryCode);
      // Save to SharedPreferences
      await _saveLanguagePreference(languageCode, countryCode);
    }
  }

  // Save language preference to SharedPreferences
  Future<void> _saveLanguagePreference(
    String languageCode,
    String countryCode,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageCodeKey, languageCode);
      await prefs.setString(_countryCodeKey, countryCode);
    } catch (e) {
      // Handle error silently - app will still work with default language
      debugPrint('Failed to save language preference: $e');
    }
  }

  // Load saved language preference from SharedPreferences
  Future<Locale?> _loadLanguagePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_languageCodeKey);
      final countryCode = prefs.getString(_countryCodeKey);

      if (languageCode != null && countryCode != null) {
        return Locale(languageCode, countryCode);
      }
    } catch (e) {
      debugPrint('Failed to load language preference: $e');
    }
    return null;
  }

  // Initialize language from saved preference or system locale
  Future<Locale> initializeLanguage() async {
    // Try to load saved preference first
    final savedLocale = await _loadLanguagePreference();
    if (savedLocale != null) {
      _currentLocale = savedLocale;
      return savedLocale;
    }

    // Fall back to default (English)
    _currentLocale = const Locale('en', 'US');
    return _currentLocale;
  }

  // Get language name by code
  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'ar':
        return 'العربية';
      default:
        return 'English';
    }
  }

  // Get language code by name
  String getLanguageCode(String languageName) {
    switch (languageName) {
      case 'English':
        return 'en';
      case 'Français':
        return 'fr';
      case 'العربية':
        return 'ar';
      default:
        return 'en';
    }
  }

  // Get country code by language code
  String getCountryCode(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'US';
      case 'fr':
        return 'FR';
      case 'ar':
        return 'SA';
      default:
        return 'US';
    }
  }

  // Get all available languages
  List<Map<String, String>> getAvailableLanguages() {
    return [
      {'name': 'English', 'code': 'en', 'country': 'US'},
      {'name': 'Français', 'code': 'fr', 'country': 'FR'},
      {'name': 'العربية', 'code': 'ar', 'country': 'SA'},
    ];
  }
}
