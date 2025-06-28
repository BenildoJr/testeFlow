import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'ynbsay6v': {
      'pt': 'Login',
      'en': '',
    },
    '8gngx8fm': {
      'pt': 'Email Address',
      'en': '',
    },
    'oz5u3njo': {
      'pt': 'Enter your email...',
      'en': '',
    },
    'h9szauvt': {
      'pt': 'Password',
      'en': '',
    },
    '6p3l2j5k': {
      'pt': 'Enter your password...',
      'en': '',
    },
    'xzqrxbqw': {
      'pt': 'Login',
      'en': '',
    },
    'hbd8llji': {
      'pt': 'Forgot Password',
      'en': '',
    },
    '11oqiuni': {
      'pt': 'Oi',
      'en': '',
    },
    '73nzjepr': {
      'pt': 'Register',
      'en': '',
    },
    '287u6gcn': {
      'pt': 'Email Address',
      'en': '',
    },
    'mzkxod07': {
      'pt': 'Enter your email...',
      'en': '',
    },
    'gfy4vrnx': {
      'pt': 'Password',
      'en': '',
    },
    'mpcmhl2a': {
      'pt': 'Enter your password...',
      'en': '',
    },
    'np1ucy23': {
      'pt': 'Confirm Password',
      'en': '',
    },
    'gas1xn65': {
      'pt': 'Enter your password...',
      'en': '',
    },
    'i50dsvte': {
      'pt': 'Create Account',
      'en': '',
    },
    'iys83cv0': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'feaa1mls': {
      'pt': '',
      'en': '',
    },
    'o1asig7a': {
      'pt': '',
      'en': '',
    },
    't29ufyio': {
      'pt': '',
      'en': '',
    },
    'd8zfydva': {
      'pt': '',
      'en': '',
    },
    'ohvnybrp': {
      'pt': '',
      'en': '',
    },
    'sx0mwdki': {
      'pt': '',
      'en': '',
    },
    'aiaca0vh': {
      'pt': '',
      'en': '',
    },
    'nf6xycp6': {
      'pt': '',
      'en': '',
    },
    'cro38fy5': {
      'pt': '',
      'en': '',
    },
    '6jq455kc': {
      'pt': '',
      'en': '',
    },
    'i85zk7e0': {
      'pt': '',
      'en': '',
    },
    '5h2wejdt': {
      'pt': '',
      'en': '',
    },
    '35f89ocl': {
      'pt': '',
      'en': '',
    },
    'wp5xdl3z': {
      'pt': '',
      'en': '',
    },
    'v698w917': {
      'pt': '',
      'en': '',
    },
    'tg0tq5vk': {
      'pt': '',
      'en': '',
    },
    'fhr1kwcx': {
      'pt': '',
      'en': '',
    },
    'vaqu2p9r': {
      'pt': '',
      'en': '',
    },
    '4817gws8': {
      'pt': '',
      'en': '',
    },
    'wma52fdd': {
      'pt': '',
      'en': '',
    },
    'mtq7pb84': {
      'pt': '',
      'en': '',
    },
    'bkp5qehq': {
      'pt': '',
      'en': '',
    },
    '3znfpoom': {
      'pt': '',
      'en': '',
    },
    'yy9u9z09': {
      'pt': '',
      'en': '',
    },
    '7zlt9goa': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
