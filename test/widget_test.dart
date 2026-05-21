import 'package:flutter_test/flutter_test.dart';
import 'package:inblue_mobile/design_system/tokens/app_colors.dart';

void main() {
  test('brand primary matches web cobaltBlue', () {
    expect(AppColors.cobaltBlue.toARGB32(), 0xFF0047AB);
  });
}
