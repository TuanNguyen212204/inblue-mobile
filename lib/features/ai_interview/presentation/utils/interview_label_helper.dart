import 'package:flutter/material.dart';

/// Helper utility for mapping interview session enum keys to user-friendly Vietnamese labels and theme colors.
class InterviewLabelHelper {
  InterviewLabelHelper._();

  static String modeLabel(String? key) => switch (key) {
        'STANDARD_MOCK' => 'Phỏng vấn tiêu chuẩn',
        'THEORY_CHECK' => 'Dò bài lý thuyết',
        'PROJECT_DEFENSE' => 'Bảo vệ dự án',
        _ => key ?? '—',
      };

  static String difficultyLabel(String? key) => switch (key) {
        'FRESHER_BASIC' => 'Cơ bản',
        'FRESHER_ADVANCED' => 'Nâng cao',
        _ => key ?? '—',
      };

  static String languageLabel(String? key) => switch (key) {
        'VI' => '🇻🇳 Tiếng Việt',
        'EN' => '🇺🇸 English',
        _ => key ?? '—',
      };

  static String domainLabel(String? key) => switch (key) {
        'IT' => '💻 IT',
        'NON_IT' => '📊 Kinh tế',
        _ => key ?? '—',
      };

  static String statusLabel(String? key) => switch (key) {
        'IN_PROGRESS' => 'Đang làm',
        'COMPLETED' => 'Hoàn thành',
        'CANCELLED' => 'Đã hủy',
        'EXPIRED' => 'Hết hạn',
        _ => key ?? '—',
      };

  static Color statusColor(String? key, ColorScheme cs) => switch (key) {
        'COMPLETED' => Colors.green.shade700,
        'IN_PROGRESS' => cs.primary,
        'CANCELLED' => cs.error,
        'EXPIRED' => Colors.orange.shade700,
        _ => cs.outline,
      };

  static Color statusBackgroundColor(String? key, ColorScheme cs) => switch (key) {
        'COMPLETED' => Colors.green.shade50,
        'IN_PROGRESS' => cs.primaryContainer,
        'CANCELLED' => cs.errorContainer,
        'EXPIRED' => Colors.orange.shade50,
        _ => cs.surfaceContainerHighest,
      };
}
