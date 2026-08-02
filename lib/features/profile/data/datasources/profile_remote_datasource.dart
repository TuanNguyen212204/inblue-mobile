import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inblue_mobile/core/constants/api_paths.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/profile/domain/entities/membership_plan.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/domain/entities/wallet_transaction.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource(this._dio);

  final Dio _dio;

  Future<UserAccount> getUser(int userId) async {
    try {
      final res = await _dio.get<dynamic>(ApiPaths.userDetail(userId));
      final map = _unwrapMap(res.data);
      return UserAccount.fromJson(map);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        final fallback = await _dio.get<dynamic>(ApiPaths.userById(userId));
        return UserAccount.fromJson(_unwrapMap(fallback.data));
      }
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<UserAccount> updateUser({
    required Map<String, dynamic> data,
    File? avatarFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'data': MultipartFile.fromString(
          jsonEncode(data),
          contentType: DioMediaType.parse('application/json'),
        ),
        'avatar': avatarFile != null
            ? await MultipartFile.fromFile(
                avatarFile.path,
                filename: avatarFile.path.split(Platform.pathSeparator).last,
              )
            : MultipartFile.fromString('', filename: 'empty'),
        'cvFile': MultipartFile.fromString('', filename: 'empty'),
      });

      final res = await _dio.post<dynamic>(
        ApiPaths.userUpdate,
        data: formData,
      );
      return UserAccount.fromJson(_unwrapMap(res.data));
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _dio.post<dynamic>(
        ApiPaths.userPassword,
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        },
      );
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<List<WalletTransaction>> getTransactions(int userId) async {
    try {
      final res = await _dio.get<dynamic>(ApiPaths.transactionsByUser(userId));
      final list = _unwrapList(res.data);
      return list
          .map((e) => WalletTransaction.fromJson(Map<String, dynamic>.from(e as Map)))
          .where((t) => !t.shouldHideFromHistory)
          .toList()
        ..sort((a, b) => (b.createdAt ?? '').compareTo(a.createdAt ?? ''));
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<String> transferIn({required int amount, required int userId}) async {
    try {
      final res = await _dio.post<dynamic>(
        ApiPaths.transactionTransferIn(amount, userId),
      );
      return _extractRedirectUrl(res.data);
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<String> transferOut({
    required int amount,
    required int userId,
    required String paymentPurpose,
  }) async {
    try {
      final res = await _dio.post<dynamic>(
        ApiPaths.transactionTransferOut,
        queryParameters: {
          'amount': amount,
          'userId': userId,
          'paymentPurpose': paymentPurpose,
        },
      );
      return _extractRedirectUrl(res.data);
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<List<MembershipPlan>> getMembershipPlans() async {
    try {
      final res = await _dio.get<dynamic>(ApiPaths.membershipPlans);
      return _unwrapList(res.data)
          .map((e) => MembershipPlan.fromJson(Map<String, dynamic>.from(e as Map)))
          .where((p) => MembershipPlan.visibleNames.contains(p.name))
          .toList();
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<UserSubscription> getSubscription(int userId) async {
    try {
      final res = await _dio.get<dynamic>(ApiPaths.userSubscription(userId));
      return UserSubscription.fromJson(_unwrapMap(res.data));
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<void> subscribePlan({required int userId, required int planId}) async {
    try {
      await _dio.post<dynamic>(ApiPaths.userSubscribe(userId, planId));
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Future<String> createPayment({
    required int amount,
    required int userId,
    String paymentPurpose = 'BUY_MEMBERSHIP',
  }) async {
    try {
      final res = await _dio.post<dynamic>(
        '${ApiPaths.paymentPay(amount, userId)}&paymentPurpose=$paymentPurpose',
      );
      return _extractRedirectUrl(res.data);
    } on DioException catch (e) {
      throw Exception(ErrorNormalizer.fromDio(e));
    }
  }

  Map<String, dynamic> _unwrapMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      final nested = data['data'] ?? data['user'] ?? data['result'];
      if (nested is Map<String, dynamic>) return nested;
      if (nested is Map) return Map<String, dynamic>.from(nested);
      return data;
    }
    if (data is Map) {
      final nested = data['data'] ?? data['user'] ?? data['result'];
      if (nested is Map) return Map<String, dynamic>.from(nested);
      return Map<String, dynamic>.from(data);
    }
    return {};
  }

  List<dynamic> _unwrapList(dynamic data) {
    if (data is List) return data;
    if (data is Map) {
      for (final key in ['data', 'content', 'items']) {
        final nested = data[key];
        if (nested is List) return nested;
      }
    }
    return [];
  }

  String _extractRedirectUrl(dynamic data) {
    if (data is String && data.startsWith('http')) return data;
    if (data is Map) {
      for (final key in [
        'checkoutUrl',
        'paymentUrl',
        'redirectUrl',
        'link',
        'url',
      ]) {
        final v = data[key];
        if (v is String && v.startsWith('http')) return v;
      }
      final nested = data['data'];
      if (nested != null) return _extractRedirectUrl(nested);
    }
    throw Exception('Không lấy được liên kết thanh toán');
  }
}
