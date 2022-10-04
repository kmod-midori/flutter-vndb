const recognizedPlatforms = <String, String>{
  'win': 'Windows',
  'lin': 'Linux',
  'mac': 'Mac OS',
  'web': 'Website',
  'tdo': '3DO',
  'ios': 'Apple iProduct',
  'and': 'Android',
  'bdp': 'Blu-ray Player',
  'dos': 'DOS',
  'dvd': 'DVD Player',
  'drc': 'Dreamcast',
  'nes': 'Famicom',
  'sfc': 'Super Famicom',
  'fm7': 'FM-7',
  'fm8': 'FM-8',
  'fmt': 'FM Towns',
  'gba': 'Game Boy Advance',
  'gbc': 'Game Boy Color',
  'msx': 'MSX',
  'nds': 'Nintendo DS',
  'swi': 'Nintendo Switch',
  'wii': 'Nintendo Wii',
  'wiu': 'Nintendo Wii U',
  'n3d': 'Nintendo 3DS',
  'p88': 'PC-88',
  'p98': 'PC-98',
  'pce': 'PC Engine',
  'pcf': 'PC-FX',
  'psp': 'PlayStation Portable',
  'ps1': 'PlayStation 1',
  'ps2': 'PlayStation 2',
  'ps3': 'PlayStation 3',
  'ps4': 'PlayStation 4',
  'ps5': 'PlayStation 5',
  'psv': 'PlayStation Vita',
  'smd': 'Sega Mega Drive',
  'scd': 'Sega Mega-CD',
  'sat': 'Sega Saturn',
  'vnd': 'VNDS',
  'x1s': 'Sharp X1',
  'x68': 'Sharp X68000',
  'xb1': 'Xbox',
  'xb3': 'Xbox 360',
  'xbo': 'Xbox One',
  'xxs': 'Xbox X/S',
  'mob': 'Other (mobile)',
  'oth': 'Other'
};

String? getPlatformIconPath(String platformCode) {
  if (recognizedPlatforms.containsKey(platformCode)) {
    return 'assets/platforms/$platformCode.svg';
  } else {
    return null;
  }
}
