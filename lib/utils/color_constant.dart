import 'app_export.dart';

class ColorConstant {
  static Color lightGrey = fromHex('#DDDDDD');
  static Color purpleJam = fromHex('#712B8F');
  static Color fuscousGrey = fromHex('#574F4F');
  static Color santaGrey = fromHex('#A3A3A3');
  static Color darkGold = fromHex('#C68716');
  static Color cadmiumOrange = fromHex('#E58628');
  static Color darkViolet = fromHex('#7E0EBD');
  static Color dawnPink = fromHex('#EBE8ED');
  static Color gainsboro = fromHex('#DED6E3');
  static Color darkJungleGreen = fromHex('#232125');
  static Color azure = fromHex('#039BE5');
  static Color copper = fromHex('#B37A2B');
  static Color luxorGold = fromHex('#B7802F');
  static Color dullOrange = fromHex('#C5933B');
  static Color turmeric = fromHex('#DCB34F');
  static Color naplesYellow = fromHex('#F8DA68');
  static Color boulder = fromHex('#777777');
  static Color red = fromHex('#DA2C2C');
  static Color rangoonGreen = fromHex('#1E1F20');
  static Color irishGreen = fromHex('#009B00');
  static Color balticSea = fromHex('#2B2B2B');
  static Color yellowOrange = fromHex('#FFB100');
  static Color purpleLight = fromHex('#BC6BDD');
  static Color lightGrey1 = fromHex('#E1E0E2');
  static Color lightGrey2 = fromHex('#E2D9D9');
  static Color grey3 = fromHex('#595959');
  static Color palePurple = fromHex('#C38BE6');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
