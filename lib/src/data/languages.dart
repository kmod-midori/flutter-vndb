final recognizedLanguages = <String, String>{
  'ar': 'Arabic',
  'bg': 'Bulgarian',
  'ca': 'Catalan',
  'cs': 'Czech',
  'da': 'Danish',
  'de': 'German',
  'el': 'Greek',
  'en': 'English',
  'eo': 'Esperanto',
  'es': 'Spanish',
  'eu': 'Basque',
  'fa': 'Persian',
  'fi': 'Finnish',
  'fr': 'French',
  'ga': 'Irish',
  'gd': 'Scottish Gaelic',
  'he': 'Hebrew',
  'hi': 'Hindi',
  'hr': 'Croatian',
  'hu': 'Hungarian',
  'id': 'Indonesian',
  'it': 'Italian',
  // 'iu': 'Inuktitut',
  'ja': 'Japanese',
  'ko': 'Korean',
  'mk': 'Macedonian',
  'ms': 'Malay',
  'la': 'Latin',
  'lt': 'Lithuanian',
  'lv': 'Latvian',
  'nl': 'Dutch',
  'no': 'Norwegian',
  'pl': 'Polish',
  'pt-br': 'Portuguese (Brazil)',
  'pt-pt': 'Portuguese (Portugal)',
  'ro': 'Romanian',
  'ru': 'Russian',
  'sk': 'Slovak',
  'sl': 'Slovene',
  'sv': 'Swedish',
  'ta': 'Tagalog',
  'th': 'Thai',
  'tr': 'Turkish',
  'uk': 'Ukrainian',
  'ur': 'Urdu',
  'vi': 'Vietnamese',
  'zh': 'Chinese',
  'zh-Hans': 'Chinese (simplified)',
  'zh-Hant': 'Chinese (traditional)'
};

String? getLanguageIconPath(String languageCode) {
  if (recognizedLanguages.containsKey(languageCode)) {
    return 'assets/languages/$languageCode.png';
  } else {
    return null;
  }
}
