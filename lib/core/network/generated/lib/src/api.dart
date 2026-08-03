//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:inblue_api/src/serializers.dart';
import 'package:inblue_api/src/auth/api_key_auth.dart';
import 'package:inblue_api/src/auth/basic_auth.dart';
import 'package:inblue_api/src/auth/bearer_auth.dart';
import 'package:inblue_api/src/auth/oauth.dart';
import 'package:inblue_api/src/api/admin_management_api.dart';
import 'package:inblue_api/src/api/application_controller_api.dart';
import 'package:inblue_api/src/api/application_detail_controller_api.dart';
import 'package:inblue_api/src/api/auth_controller_api.dart';
import 'package:inblue_api/src/api/candidate_profile_controller_api.dart';
import 'package:inblue_api/src/api/chat_message_controller_api.dart';
import 'package:inblue_api/src/api/code_review_problem_controller_api.dart';
import 'package:inblue_api/src/api/coding_problem_controller_api.dart';
import 'package:inblue_api/src/api/company_controller_api.dart';
import 'package:inblue_api/src/api/dashboard_controller_api.dart';
import 'package:inblue_api/src/api/email_submission_controller_api.dart';
import 'package:inblue_api/src/api/interview_analysis_controller_api.dart';
import 'package:inblue_api/src/api/interview_process_controller_api.dart';
import 'package:inblue_api/src/api/interview_session_controller_api.dart';
import 'package:inblue_api/src/api/interview_template_controller_api.dart';
import 'package:inblue_api/src/api/jd_purchase_controller_api.dart';
import 'package:inblue_api/src/api/job_description_api.dart';
import 'package:inblue_api/src/api/kiosk_booking_controller_api.dart';
import 'package:inblue_api/src/api/kiosk_controller_api.dart';
import 'package:inblue_api/src/api/mail_controller_api.dart';
import 'package:inblue_api/src/api/mentor_controller_api.dart';
import 'package:inblue_api/src/api/mentor_feedback_controller_api.dart';
import 'package:inblue_api/src/api/mentor_review_controller_api.dart';
import 'package:inblue_api/src/api/notification_controller_api.dart';
import 'package:inblue_api/src/api/payment_controller_api.dart';
import 'package:inblue_api/src/api/post_controller_api.dart';
import 'package:inblue_api/src/api/proctoring_controller_api.dart';
import 'package:inblue_api/src/api/question_bank_controller_api.dart';
import 'package:inblue_api/src/api/question_category_controller_api.dart';
import 'package:inblue_api/src/api/round_controller_api.dart';
import 'package:inblue_api/src/api/session_controller_api.dart';
import 'package:inblue_api/src/api/test_controller_api.dart';
import 'package:inblue_api/src/api/user_controller_api.dart';

class InblueApi {
  static const String basePath = r'https://api.kdz.asia';

  final Dio dio;
  final Serializers serializers;

  InblueApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the OAuth token associated with the given [name].
  ///
  /// If no [OAuthInterceptor] is registered or no token exists for the given
  /// [name], this method has no effect.
  void removeOAuthToken(String name) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens.remove(name);
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the bearer authentication token associated with the given [name].
  ///
  /// If no [BearerAuthInterceptor] is registered or no token exists for the
  /// given [name], this method has no effect.
  void removeBearerAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens.remove(name);
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  /// Removes the basic authentication credentials associated with the given [name].
  ///
  /// If no [BasicAuthInterceptor] is registered or no credentials exist for the
  /// given [name], this method has no effect.
  void removeBasicAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo.remove(name);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Removes the API key associated with the given [name].
  ///
  /// If no [ApiKeyAuthInterceptor] is registered or no API key exists for the
  /// given [name], this method has no effect.
  void removeApiKey(String name) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys.remove(name);
    }
  }

  /// Get AdminManagementApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AdminManagementApi getAdminManagementApi() {
    return AdminManagementApi(dio, serializers);
  }

  /// Get ApplicationControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ApplicationControllerApi getApplicationControllerApi() {
    return ApplicationControllerApi(dio, serializers);
  }

  /// Get ApplicationDetailControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ApplicationDetailControllerApi getApplicationDetailControllerApi() {
    return ApplicationDetailControllerApi(dio, serializers);
  }

  /// Get AuthControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthControllerApi getAuthControllerApi() {
    return AuthControllerApi(dio, serializers);
  }

  /// Get CandidateProfileControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CandidateProfileControllerApi getCandidateProfileControllerApi() {
    return CandidateProfileControllerApi(dio, serializers);
  }

  /// Get ChatMessageControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ChatMessageControllerApi getChatMessageControllerApi() {
    return ChatMessageControllerApi(dio, serializers);
  }

  /// Get CodeReviewProblemControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CodeReviewProblemControllerApi getCodeReviewProblemControllerApi() {
    return CodeReviewProblemControllerApi(dio, serializers);
  }

  /// Get CodingProblemControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CodingProblemControllerApi getCodingProblemControllerApi() {
    return CodingProblemControllerApi(dio, serializers);
  }

  /// Get CompanyControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CompanyControllerApi getCompanyControllerApi() {
    return CompanyControllerApi(dio, serializers);
  }

  /// Get DashboardControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DashboardControllerApi getDashboardControllerApi() {
    return DashboardControllerApi(dio, serializers);
  }

  /// Get EmailSubmissionControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EmailSubmissionControllerApi getEmailSubmissionControllerApi() {
    return EmailSubmissionControllerApi(dio, serializers);
  }

  /// Get InterviewAnalysisControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InterviewAnalysisControllerApi getInterviewAnalysisControllerApi() {
    return InterviewAnalysisControllerApi(dio, serializers);
  }

  /// Get InterviewProcessControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InterviewProcessControllerApi getInterviewProcessControllerApi() {
    return InterviewProcessControllerApi(dio, serializers);
  }

  /// Get InterviewSessionControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InterviewSessionControllerApi getInterviewSessionControllerApi() {
    return InterviewSessionControllerApi(dio, serializers);
  }

  /// Get InterviewTemplateControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InterviewTemplateControllerApi getInterviewTemplateControllerApi() {
    return InterviewTemplateControllerApi(dio, serializers);
  }

  /// Get JdPurchaseControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  JdPurchaseControllerApi getJdPurchaseControllerApi() {
    return JdPurchaseControllerApi(dio, serializers);
  }

  /// Get JobDescriptionApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  JobDescriptionApi getJobDescriptionApi() {
    return JobDescriptionApi(dio, serializers);
  }

  /// Get KioskBookingControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  KioskBookingControllerApi getKioskBookingControllerApi() {
    return KioskBookingControllerApi(dio, serializers);
  }

  /// Get KioskControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  KioskControllerApi getKioskControllerApi() {
    return KioskControllerApi(dio, serializers);
  }

  /// Get MailControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MailControllerApi getMailControllerApi() {
    return MailControllerApi(dio, serializers);
  }

  /// Get MentorControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MentorControllerApi getMentorControllerApi() {
    return MentorControllerApi(dio, serializers);
  }

  /// Get MentorFeedbackControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MentorFeedbackControllerApi getMentorFeedbackControllerApi() {
    return MentorFeedbackControllerApi(dio, serializers);
  }

  /// Get MentorReviewControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MentorReviewControllerApi getMentorReviewControllerApi() {
    return MentorReviewControllerApi(dio, serializers);
  }

  /// Get NotificationControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NotificationControllerApi getNotificationControllerApi() {
    return NotificationControllerApi(dio, serializers);
  }

  /// Get PaymentControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PaymentControllerApi getPaymentControllerApi() {
    return PaymentControllerApi(dio, serializers);
  }

  /// Get PostControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PostControllerApi getPostControllerApi() {
    return PostControllerApi(dio, serializers);
  }

  /// Get ProctoringControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ProctoringControllerApi getProctoringControllerApi() {
    return ProctoringControllerApi(dio, serializers);
  }

  /// Get QuestionBankControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  QuestionBankControllerApi getQuestionBankControllerApi() {
    return QuestionBankControllerApi(dio, serializers);
  }

  /// Get QuestionCategoryControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  QuestionCategoryControllerApi getQuestionCategoryControllerApi() {
    return QuestionCategoryControllerApi(dio, serializers);
  }

  /// Get RoundControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RoundControllerApi getRoundControllerApi() {
    return RoundControllerApi(dio, serializers);
  }

  /// Get SessionControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SessionControllerApi getSessionControllerApi() {
    return SessionControllerApi(dio, serializers);
  }

  /// Get TestControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TestControllerApi getTestControllerApi() {
    return TestControllerApi(dio, serializers);
  }

  /// Get UserControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserControllerApi getUserControllerApi() {
    return UserControllerApi(dio, serializers);
  }
}
