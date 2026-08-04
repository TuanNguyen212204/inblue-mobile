import 'dart:io';

import 'package:inblue_mobile/features/ai_interview/domain/entities/candidate_profile.dart';
import 'package:inblue_mobile/features/profile/domain/entities/jd_purchase.dart';
import 'package:inblue_mobile/features/profile/domain/entities/membership_plan.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/domain/entities/wallet_transaction.dart';

abstract interface class ProfileRepository {
  Future<UserAccount> getUser(int userId);
  Future<UserAccount> updateUser({
    required UserAccount user,
    File? avatarFile,
  });
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<List<WalletTransaction>> getTransactions(int userId);
  Future<List<JdPurchase>> getJdPurchases();
  Future<String> topUpWallet({required int amount, required int userId});
  Future<List<MembershipPlan>> getMembershipPlans();
  Future<UserSubscription> getSubscription(int userId);
  Future<String> payMembershipWithPayOs({
    required int amount,
    required int userId,
  });
  Future<void> payMembershipWithWallet({
    required int amount,
    required int userId,
    required int planId,
  });
  Future<CandidateProfile?> getCandidateProfile(int userId);
  Future<CandidateProfile> saveCandidateProfile(CandidateProfile profile);
  Future<CandidateProfile> uploadCv({required int userId, required File file});
}
