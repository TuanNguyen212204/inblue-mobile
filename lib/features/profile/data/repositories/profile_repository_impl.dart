import 'dart:io';

import 'package:inblue_mobile/features/ai_interview/data/datasources/candidate_profile_remote_datasource.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/candidate_profile.dart';
import 'package:inblue_mobile/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:inblue_mobile/features/profile/domain/entities/membership_plan.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/domain/entities/wallet_transaction.dart';
import 'package:inblue_mobile/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._profile, this._candidate);

  final ProfileRemoteDataSource _profile;
  final CandidateProfileRemoteDataSource _candidate;

  @override
  Future<UserAccount> getUser(int userId) => _profile.getUser(userId);

  @override
  Future<UserAccount> updateUser({
    required UserAccount user,
    File? avatarFile,
  }) =>
      _profile.updateUser(data: user.toUpdateJson(), avatarFile: avatarFile);

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) =>
      _profile.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

  @override
  Future<List<WalletTransaction>> getTransactions(int userId) =>
      _profile.getTransactions(userId);

  @override
  Future<String> topUpWallet({required int amount, required int userId}) =>
      _profile.transferIn(amount: amount, userId: userId);

  @override
  Future<List<MembershipPlan>> getMembershipPlans() =>
      _profile.getMembershipPlans();

  @override
  Future<UserSubscription> getSubscription(int userId) =>
      _profile.getSubscription(userId);

  @override
  Future<String> payMembershipWithPayOs({
    required int amount,
    required int userId,
  }) =>
      _profile.createPayment(amount: amount, userId: userId);

  @override
  Future<void> payMembershipWithWallet({
    required int amount,
    required int userId,
    required int planId,
  }) async {
    final result = await _profile.transferOut(
      amount: amount,
      userId: userId,
      paymentPurpose: 'BUY_MEMBERSHIP',
    );
    if (result.startsWith('http')) {
      throw Exception('Cần thanh toán qua PayOS: $result');
    }
    await _profile.subscribePlan(userId: userId, planId: planId);
  }

  @override
  Future<CandidateProfile?> getCandidateProfile(int userId) =>
      _candidate.getByUserId(userId);

  @override
  Future<CandidateProfile> saveCandidateProfile(CandidateProfile profile) {
    if (profile.hasValidId) {
      return _candidate.updateProfile(profile);
    }
    return _candidate.createProfile(profile);
  }

  @override
  Future<CandidateProfile> uploadCv({
    required int userId,
    required File file,
  }) =>
      _candidate.uploadCv(userId: userId, file: file);
}
