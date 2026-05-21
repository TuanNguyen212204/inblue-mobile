/// REST path constants — parity with web `api.config.ts`.
abstract final class ApiPaths {
  // Auth
  static const authLogin = '/api/auth/login';

  // Users
  static String userSubscription(int userId) =>
      '/api/users/$userId/subscription';
  static String userById(int userId) => '/api/users/find-by-id/$userId';

  // AI Interview
  static const interviewConfigOptions = '/api/interview-sessions/config-options';
  static const interviewGenerateJd =
      '/api/interview-sessions/generate-job-requirement';
  static const interviewCreateSession = '/api/interview-sessions/create-session';
  static String interviewSessionsByUser(int userId) =>
      '/api/interview-sessions/user/$userId';
  static String interviewSessionById(int id) => '/api/interview-sessions/$id';
  static String interviewCache(String sessionKey) =>
      '/api/interview-sessions/cache/$sessionKey';
  static String interviewStart(String sessionKey) =>
      '/api/v1/interview/start/$sessionKey';
  static const interviewSubmit = '/api/v1/interview/submit';

  // Candidate profile
  static String candidateProfile(int userId) =>
      '/api/candidate-profiles/$userId';
  static const candidateProfiles = '/api/candidate-profiles';
  static const uploadCv = '/api/users/upload-cv';

  // Practice sets
  static String practiceSetsByInterview(int id) =>
      '/api/practice-sets/interview-session/$id';
  static const practiceSetCreateByAi = '/api/practice-sets/create-by-ai';

  // Mock interview
  static const mentors = '/api/mentors';
  static String mentorById(int id) => '/api/mentors/$id';
  static const sessionCreate = '/api/sessions/create-session';
  static String sessionsByUser(int userId) => '/api/sessions/$userId/by-user';
  static String sessionById(int id) => '/api/sessions/$id';
  static const sessionUpdate = '/api/sessions';
  static String sessionMakePayment = '/api/sessions/make-payment';
  static const sessionJoin = '/api/sessions/join-session';
  static const transactionTransferOut = '/api/transactions/transfer-out';

  // Mentor feedback / review
  static const mentorFeedbacks = '/api/mentor-feedbacks';
  static String mentorFeedbackById(int id) => '/api/mentor-feedbacks/$id';
  static const mentorReviews = '/api/mentor-reviews';
  static String mentorReviewById(int id) => '/api/mentor-reviews/$id';

  // Notifications
  static String notifications(int userId) => '/api/notifications/$userId';
  static String notificationMarkRead(int id) =>
      '/api/notifications/check-read/$id';
}
