import 'package:dio/dio.dart';

/// Maps API/network errors to user-friendly Vietnamese messages (parity web).
abstract final class ErrorNormalizer {
  static String fromDio(DioException error) {
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return 'Không thể kết nối đến máy chủ. Vui lòng kiểm tra kết nối mạng.';
    }

    final status = error.response?.statusCode;
    final bodyMessage = _extractMessage(error.response?.data);

    if (bodyMessage != null) {
      final mapped = _mapContentPattern(bodyMessage);
      if (mapped != null) return mapped;
    }

    return switch (status) {
      400 => 'Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.',
      401 => 'Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại.',
      403 => 'Bạn không có quyền thực hiện thao tác này.',
      404 => 'Không tìm thấy dữ liệu yêu cầu.',
      409 => 'Dữ liệu bị xung đột. Vui lòng thử lại.',
      413 => 'Tập tin quá lớn. Vui lòng chọn file nhỏ hơn.',
      429 => 'Quá nhiều yêu cầu. Vui lòng thử lại sau.',
      500 => 'Hệ thống đang gặp sự cố. Vui lòng thử lại sau.',
      503 => 'Dịch vụ đang bảo trì. Vui lòng thử lại sau.',
      504 => 'Máy chủ phản hồi quá chậm. Vui lòng thử lại.',
      _ => bodyMessage ?? error.message ?? 'Đã xảy ra lỗi không xác định.',
    };
  }

  static String? _extractMessage(dynamic data) {
    if (data == null) return null;
    if (data is String && data.trim().isNotEmpty) return data.trim();
    if (data is Map) {
      for (final key in ['message', 'error', 'detail']) {
        final v = data[key];
        if (v is String && v.trim().isNotEmpty) return v.trim();
      }
    }
    return null;
  }

  static String? _mapContentPattern(String message) {
    final lower = message.toLowerCase();
    if (lower.contains('insufficient balance')) {
      return 'Số dư ví không đủ để thanh toán phiên phỏng vấn.';
    }
    if (lower.contains('session not found')) {
      return 'Không tìm thấy phiên phỏng vấn.';
    }
    if (lower.contains('not found') ||
        lower.contains('expired') ||
        lower.contains('404')) {
      return 'Phiên đã hết hạn sau 1 giờ không hoạt động.';
    }
    return null;
  }

  static bool isSessionExpiredError(String message) {
    final lower = message.toLowerCase();
    return lower.contains('not found') ||
        lower.contains('expired') ||
        lower.contains('404');
  }
}
