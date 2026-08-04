import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/candidate_profile.dart';
import 'package:inblue_mobile/features/auth/presentation/providers/auth_notifier.dart';
import 'package:inblue_mobile/features/profile/domain/entities/jd_purchase.dart';
import 'package:inblue_mobile/features/profile/domain/entities/membership_plan.dart';
import 'package:inblue_mobile/features/profile/domain/entities/user_account.dart';
import 'package:inblue_mobile/features/profile/domain/entities/wallet_transaction.dart';
import 'package:inblue_mobile/features/profile/presentation/providers/profile_providers.dart';

class AccountBundle {
  AccountBundle({
    required this.user,
    required this.transactions,
    required this.jdPurchases,
    required this.plans,
    required this.subscription,
    this.candidate,
  });

  final UserAccount user;
  final List<WalletTransaction> transactions;
  final List<JdPurchase> jdPurchases;
  final List<MembershipPlan> plans;
  final UserSubscription subscription;
  final CandidateProfile? candidate;

  AccountBundle copyWith({
    UserAccount? user,
    List<WalletTransaction>? transactions,
    List<JdPurchase>? jdPurchases,
    List<MembershipPlan>? plans,
    UserSubscription? subscription,
    CandidateProfile? candidate,
  }) =>
      AccountBundle(
        user: user ?? this.user,
        transactions: transactions ?? this.transactions,
        jdPurchases: jdPurchases ?? this.jdPurchases,
        plans: plans ?? this.plans,
        subscription: subscription ?? this.subscription,
        candidate: candidate ?? this.candidate,
      );
}

final accountNotifierProvider =
    AsyncNotifierProvider<AccountNotifier, AccountBundle>(AccountNotifier.new);

class AccountNotifier extends AsyncNotifier<AccountBundle> {
  @override
  Future<AccountBundle> build() async {
    final userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      throw Exception('Chưa đăng nhập');
    }
    return _load(userId);
  }

  Future<AccountBundle> _load(int userId) async {
    final repo = ref.read(profileRepositoryProvider);
    final authUser = ref.read(authNotifierProvider).valueOrNull?.user;

    final userAccountFuture = repo.getUser(userId).catchError((_) {
      if (authUser != null) {
        return UserAccount(
          id: authUser.id,
          email: authUser.email,
          name: authUser.name,
          role: authUser.role,
        );
      }
      return UserAccount(id: userId, email: '');
    });

    final txsFuture = repo
        .getTransactions(userId)
        .catchError((_) => <WalletTransaction>[]);
    final jdPurchasesFuture = repo
        .getJdPurchases()
        .catchError((_) => <JdPurchase>[]);
    final plansFuture =
        repo.getMembershipPlans().catchError((_) => <MembershipPlan>[]);
    final subFuture =
        repo.getSubscription(userId).catchError((_) => UserSubscription());
    final candFuture =
        repo.getCandidateProfile(userId).catchError((_) => null);

    final results = await Future.wait([
      userAccountFuture,
      txsFuture,
      jdPurchasesFuture,
      plansFuture,
      subFuture,
      candFuture,
    ]);

    return AccountBundle(
      user: results[0] as UserAccount,
      transactions: results[1] as List<WalletTransaction>,
      jdPurchases: results[2] as List<JdPurchase>,
      plans: results[3] as List<MembershipPlan>,
      subscription: results[4] as UserSubscription,
      candidate: results[5] as CandidateProfile?,
    );
  }

  Future<void> refresh() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _load(userId));
    await ref.read(authNotifierProvider.notifier).refreshUserProfile();
  }

  Future<UserAccount> updatePersonal({
    required UserAccount user,
    File? avatarFile,
  }) async {
    final updated =
        await ref.read(profileRepositoryProvider).updateUser(
              user: user,
              avatarFile: avatarFile,
            );
    _patchUser(updated);
    await ref.read(authNotifierProvider.notifier).refreshUserProfile();
    return updated;
  }

  Future<UserAccount> removeAvatar({required UserAccount user}) async {
    final updated =
        await ref.read(profileRepositoryProvider).updateUser(
              user: user,
              avatarFile: null,
            );
    _patchUser(updated);
    await ref.read(authNotifierProvider.notifier).refreshUserProfile();
    return updated;
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await ref.read(profileRepositoryProvider).changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
  }

  Future<String> topUp(int amount) async {
    final userId = ref.read(currentUserIdProvider)!;
    final url = await ref.read(profileRepositoryProvider).topUpWallet(
          amount: amount,
          userId: userId,
        );
    return url;
  }

  Future<void> refreshTransactions() async {
    final userId = ref.read(currentUserIdProvider);
    final current = state.valueOrNull;
    if (userId == null || current == null) return;
    final txs =
        await ref.read(profileRepositoryProvider).getTransactions(userId);
    state = AsyncData(current.copyWith(transactions: txs, user: current.user));
  }

  Future<String> payMembershipPayOs(int amount) async {
    final userId = ref.read(currentUserIdProvider)!;
    return ref.read(profileRepositoryProvider).payMembershipWithPayOs(
          amount: amount,
          userId: userId,
        );
  }

  Future<void> payMembershipWallet({
    required int amount,
    required int planId,
  }) async {
    final userId = ref.read(currentUserIdProvider)!;
    await ref.read(profileRepositoryProvider).payMembershipWithWallet(
          amount: amount,
          userId: userId,
          planId: planId,
        );
    await refresh();
  }

  Future<CandidateProfile> saveCandidate(CandidateProfile profile) async {
    final saved =
        await ref.read(profileRepositoryProvider).saveCandidateProfile(profile);
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(candidate: saved));
    }
    return saved;
  }

  Future<CandidateProfile> uploadCandidateCv(File file) async {
    final userId = ref.read(currentUserIdProvider)!;
    final saved = await ref.read(profileRepositoryProvider).uploadCv(
          userId: userId,
          file: file,
        );
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(candidate: saved));
    }
    return saved;
  }

  void _patchUser(UserAccount user) {
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(user: user));
    }
  }
}
