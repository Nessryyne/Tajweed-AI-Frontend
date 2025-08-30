@echo off
REM Generate Localization Files for Tajweed AI
REM This script regenerates the localization keys and files

echo 🌐 Generating localization files for Tajweed AI...

REM Navigate to project root
cd /d "%~dp0\.."

REM Generate localization keys
echo 📝 Generating localization keys...
dart run easy_localization:generate -S "assets/translations" -O "lib/l10n" -o "locale_keys.g.dart" -f keys

echo ✅ Localization files generated successfully!
echo 📁 Files generated in: lib/l10n/
echo 🔑 Keys file: lib/l10n/locale_keys.g.dart
echo.
echo 💡 Remember to:
echo    - Add new translation keys to all language files
echo    - Use LocaleKeys.KEY_NAME.tr() in your code
echo    - Test with different languages
echo    - File names must match locale codes: en-US.json, fr-FR.json, ar-SA.json
echo.
echo 🚀 Your app is now ready for internationalization!
pause
