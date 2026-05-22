import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

abstract final class ProfileUiUtils {
  static final _vnd = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: '₫',
    decimalDigits: 0,
  );

  static String formatVnd(num value) => _vnd.format(value);

  static void showToast(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(context).colorScheme.error
            : null,
      ),
    );
  }

  static Future<bool> launchPaymentUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) return false;
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static String stripExceptionPrefix(Object e) {
    final s = e.toString();
    if (s.startsWith('Exception: ')) return s.substring(11);
    return s;
  }
}
